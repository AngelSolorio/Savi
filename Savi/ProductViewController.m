//
//  ProductViewController.m
//  Savi
//
//  Created by Sandra Guzman on 19/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "ProductViewController.h"
#import "ReviewViewController.h"
#import "SubmissionViewController.h"
#import "DetailViewController.h"
#import "Company.h"
#import "CompanyCell.h"
#import "Product.h"
#import "ProductCell.h"

@implementation ProductViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    // Loads the company options
    companyData = [[NSArray alloc] initWithArray:[Company getAllCompanies]];
    // Loads the all products
    productData = [[NSArray alloc] initWithArray:[Product getAllProducts]];
    
    // Sets the TableViewFooter
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 1.0, 1.0, 1.0)];
    footerView.backgroundColor = [UIColor clearColor];
    tableCompanies.tableFooterView = footerView;
    tableProducts.tableFooterView = footerView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    segmentFilters.selectedSegmentIndex = self.index;
}


#pragma mark - UITableViewDatasource & UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:tableCompanies]) {
        // Loads the company options
        NSInteger companyId;
        
        if (searchingCompany) {
            companyId = [[[copyCompanyData objectAtIndex:indexPath.row] id_company] intValue];
        } else {
            companyId = [[[companyData objectAtIndex:indexPath.row] id_company] intValue];
        }
        
        productData = [[NSArray alloc] initWithArray:[Product getAllProductsWithCompany:companyId]];
        [tableProducts reloadData];
    } else {
        Product *product;
        
        if (searchingProduct) {
            product = [copyProductData objectAtIndex:indexPath.row];
        } else {
            product = [productData objectAtIndex:indexPath.row];
        }
        
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UINavigationController *navigationController;
        switch (segmentFilters.selectedSegmentIndex) {
            case 2: {
                ReviewViewController *reviewVC = (ReviewViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"reviewView"];
                reviewVC.title = product.name;
                navigationController = [[UINavigationController alloc] initWithRootViewController:reviewVC];
                break;
            }
            case 3: {
                SubmissionViewController *submissionwVC = (SubmissionViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"submissionView"];
                submissionwVC.title = product.name;
                navigationController = [[UINavigationController alloc] initWithRootViewController:submissionwVC];
                break;
            }
            default: {
                DetailViewController *detailVC = (DetailViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"detailView"];
                detailVC.title = product.name;
                navigationController = [[UINavigationController alloc] initWithRootViewController:detailVC];
                break;
            }
        }
        
        REFrostedViewController *root = [[REFrostedViewController alloc]
                                         initWithContentViewController:navigationController
                                         menuViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"menuController"]];
        // Hides the Navigation Bar
        [self.navigationController setNavigationBarHidden:YES];
        [self.navigationController pushViewController:root animated:YES];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    if ([tableView isEqual:tableCompanies]) {
        if (searchingCompany) {
            return copyCompanyData.count;
        } else {
            return companyData.count;
        }
    } else {
        if (searchingProduct) {
            return copyProductData.count;
        } else {
            return productData.count;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:tableCompanies]) {
        CompanyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"companyCell"];
        cell.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.2];
        
        Company *company;
        
        if (searchingCompany) {
            company = [copyCompanyData objectAtIndex:indexPath.row];
        } else {
            company = [companyData objectAtIndex:indexPath.row];
        }
        cell.labelName.text = [NSString stringWithFormat:@"%@ .  %@", company.id_company, company.name];
        
        return cell;
    } else {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
        cell.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.2];
        
        Product *product;
        
        if (searchingProduct) {
            product = [copyProductData objectAtIndex:indexPath.row];
        } else {
            product = [productData objectAtIndex:indexPath.row];
        }
        
        cell.labelName.text = product.name;
        cell.labelDetails.text = [NSString stringWithFormat:@"Fecha de Desarrollo: %@", product.manufacture_date];
        
        return cell;
    }
}


#pragma mark - UISearchBar delegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    if (!searchBar.showsCancelButton) {
        searchBar.showsCancelButton = YES;
        
        if ([searchBar isEqual:self.searchBarCompany]) {
            [tableCompanies setHidden:NO];
        } else {
            [tableProducts setHidden:NO];
        }
    }
}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
    if ([theSearchBar isEqual:self.searchBarCompany]) {
        copyCompanyData = [[NSMutableArray alloc] init];
        
        if ([searchText length] > 0) {
            searchingCompany = YES;
            [self searchString:theSearchBar];
            [tableCompanies setHidden:NO];
        } else {
            searchingCompany = NO;
        }
        
        [tableCompanies reloadData];
    } else {
        copyProductData = [[NSMutableArray alloc] init];
        
        if ([searchText length] > 0) {
            searchingProduct = YES;
            [self searchString:theSearchBar];
            [tableProducts setHidden:NO];
        } else {
            searchingProduct = NO;
        }
        
        [tableProducts reloadData];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)aSearchBar {
    aSearchBar.text = @"";
    aSearchBar.showsCancelButton = NO;
    [aSearchBar resignFirstResponder];
    
    if ([aSearchBar isEqual:self.searchBarCompany]) {
        searchingCompany = NO;
        [tableCompanies reloadData];
    } else {
        searchingProduct = NO;
        [tableProducts reloadData];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchString:(UISearchBar *)searchBar {
    NSString *nameTemp;
    NSMutableArray *searchArray;
    
    if ([searchBar isEqual:self.searchBarCompany]) {
        searchArray = [[NSMutableArray alloc] initWithArray:companyData];
        
        for (int x = 0; x < [searchArray count]; x++) {
            if ([[searchArray objectAtIndex:x] isKindOfClass:[Company class]]) {
                Company *company = [searchArray objectAtIndex:x];
                nameTemp = (company.name != nil) ? [[NSString alloc] initWithString:company.name] : @"";
                NSRange nameResultsRange = [nameTemp rangeOfString:searchBar.text options:NSCaseInsensitiveSearch];
                if (nameResultsRange.length > 0 && ![copyCompanyData containsObject:company]) {
                    [copyCompanyData addObject:company];
                }
            }
        }
    } else {
        searchArray = [[NSMutableArray alloc] initWithArray:productData];
        
        for (int x = 0; x < [searchArray count]; x++) {
            if ([[searchArray objectAtIndex:x] isKindOfClass:[Product class]]) {
                Product *product = [searchArray objectAtIndex:x];
                nameTemp = (product.name != nil) ? [[NSString alloc] initWithString:product.name] : @"";
                NSRange nameResultsRange = [nameTemp rangeOfString:searchBar.text options:NSCaseInsensitiveSearch];
                if (nameResultsRange.length > 0 && ![copyProductData containsObject:product]) {
                    [copyProductData addObject:product];
                }
            }
        }
    }
    
    searchArray = nil;
}

@end
