//
//  DetailViewController.m
//  Savi
//
//  Created by Sandra Guzman on 21/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "DetailViewController.h"
#import "CompanyCell.h"

@implementation DetailViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    keyData = [[NSArray alloc] init];
}

- (IBAction)showMenu {
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

#pragma mark - UITableViewDatasource & UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    return keyData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CompanyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"companyCell"];
    cell.labelName.text = [[keyData objectAtIndex:indexPath.row] name];

    return cell;
}

@end
