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
}


#pragma mark - UITableViewDatasource & UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    return companyData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CompanyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"companyCell"];
    cell.labelName.text = [NSString stringWithFormat:@"%@ .  %@", [[companyData objectAtIndex:indexPath.row] id_company], [[companyData objectAtIndex:indexPath.row] name]];
    
    return cell;
}

@end
