//
//  ProductViewController.m
//  Savi
//
//  Created by Sandra Guzman on 19/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "ProductViewController.h"
#import "Company.h"
#import "CompanyCell.h"
#import "Product.h"
#import "ProductCell.h"

@implementation ProductViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    // Loads the company options
    [Company getAllCompanies_completion:^(NSArray *companiesArray, NSError *error){
        if (!error) {
            companyData = [[NSArray alloc] initWithArray:companiesArray];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
                [tableCompanies reloadData];
            }];
        }
    }];
    
    // Loads the all products
    [Product getAllProducts_completion:^(NSArray *productsArray, NSError *error){
        if (!error) {
            productData = [[NSArray alloc] initWithArray:productsArray];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
                [tableProducts reloadData];
            }];
        }
    }];
}


#pragma mark - UITableViewDatasource & UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:tableCompanies]) {
        // Loads the company options
        [Product getProductsWithCompanyId:[[[companyData objectAtIndex:indexPath.row] id_company] intValue]
                               completion:^(NSArray *productsArray, NSError *error){
                                   if (!error) {
                                       productData = [[NSArray alloc] initWithArray:productsArray];
                                       [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
                                           [tableProducts reloadData];
                                       }];
                                   }
                               }];
    } else { // tableView == _secondTable
       
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    if ([tableView isEqual:tableCompanies]) {
        return companyData.count;
    } else {
        return productData.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:tableCompanies]) {
        CompanyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"companyCell"];
        cell.labelName.text = [NSString stringWithFormat:@"%@ .  %@", [[companyData objectAtIndex:indexPath.row] id_company], [[companyData objectAtIndex:indexPath.row] name]];
        
        return cell;
    } else {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
        cell.labelName.text = [[productData objectAtIndex:indexPath.row] name];
        cell.labelDetails.text = [NSString stringWithFormat:@"Fecha de Desarrollo: %@", [[productData objectAtIndex:indexPath.row] manufacture_date]];
        
        return cell;
    }
}

@end
