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
    self.labelComment.text = self.productDetails.comment;
    self.labelStatus.text = self.productDetails.status;
    self.labelStatusUpdate.text = [NSString stringWithFormat:@"%@", self.productDetails.last_modified_date ];
    self.labelMedical.text = self.productDetails.medica;
    self.labelChemical.text = self.productDetails.quimica;
    self.labelLegal.text = self.productDetails.juridica;
    self.labelApi1.text = self.productDetails.fab_farmaco1;
    self.labelApi2.text = self.productDetails.fab_farmaco2;
    self.labelProdCompleted.text = self.productDetails.fab_medic;
    self.labelAcPrimary.text = self.productDetails.acond_pri;
    self.labelAcSecondary.text = self.productDetails.acond_sec;
    
    keyData = [self.productDetails.keys allObjects];
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
    KeyDetail *detail = [keyData objectAtIndex:indexPath.row];
    self.labelKey.text = [NSString stringWithFormat:@"%d", [detail.clave intValue]];
    self.labelKeyDescription.text = detail.detail;
    self.labelLab.text = detail.laboratory;
    self.labelUnits.text = [NSString stringWithFormat:@"%d",[detail.unity intValue]];
    self.labelValues.text = detail.value;
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
