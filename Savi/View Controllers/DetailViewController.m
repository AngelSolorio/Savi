//
//  DetailViewController.m
//  Savi
//
//  Created by Sandra Guzman on 21/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "DetailViewController.h"
#import "CompanyCell.h"
#import "Utility.h"
#import "TypeDefs.h"
#import "ProductViewController.h"
#import "REFrostedViewController.h"

@implementation DetailViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *rightSwipe  =  [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    [rightSwipe setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:rightSwipe];
    
    // Sets the TableViewFooter
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 1.0, 1.0, 1.0)];
    footerView.backgroundColor = [UIColor clearColor];
    self.tableKey.tableFooterView = footerView;
    
    if ([self.tableKey respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableKey setLayoutMargins:UIEdgeInsetsZero];
    }
    
    self.labelComment.text = self.productDetails.comment;
    
    NSLog(@"descrippcion %@", [self.productDetails  description]);
    self.labelStatus.text = self.productDetails.status;
    self.labelStatusUpdate.text = [Utility getStringFromDate:self.productDetails.last_modified_date  withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    self.labelMedical.text = self.productDetails.medica;
    self.labelChemical.text = self.productDetails.quimica;
    self.labelLegal.text = self.productDetails.juridica;
    self.labelApi1.text = self.productDetails.fab_farmaco1;
    self.labelApi2.text = self.productDetails.fab_farmaco2;
    self.labelProdCompleted.text = self.productDetails.fab_medic;
    self.labelAcPrimary.text = self.productDetails.acond_pri;
    self.labelAcSecondary.text = self.productDetails.acond_sec;
    
    keyData = [[NSArray alloc] initWithArray:[self.productDetails.keys allObjects]];
    
    if ([keyData count] > 0) {
        NSIndexPath *indexSelected = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableKey selectRowAtIndexPath:indexSelected
                                   animated:NO
                             scrollPosition:UITableViewScrollPositionTop];
        [self refreshKeyDetails:indexSelected];
    }
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
    [self refreshKeyDetails:indexPath];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    return keyData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CompanyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"companyCell"];
    cell.labelName.text = [NSString stringWithFormat:@"%@",[[keyData objectAtIndex:indexPath.row] clave] ];

    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.2]];
}

#pragma mark - Others Methods

- (void)refreshKeyDetails:(NSIndexPath *)indexPath {
    KeyDetail *detail = [keyData objectAtIndex:indexPath.row];
    self.labelKey.text = [NSString stringWithFormat:@"%d", [detail.clave intValue]];
    self.labelKeyDescription.text = detail.detail;
    self.labelLab.text = detail.laboratory;
    self.labelUnits.text = [NSString stringWithFormat:@"%d",[detail.unity intValue]];
    self.labelValues.text = detail.value;
}


#pragma mark - UISwipeGestureRecognizer Methods

- (IBAction)handleSwipeGesture:(UISwipeGestureRecognizer *)sender {
    UIViewController *view = [self.navigationController.viewControllers objectAtIndex:0];
    
    if ([view isKindOfClass:[DetailViewController class]]) {
        UINavigationController *nav = self.parentViewController.parentViewController.navigationController;
        [nav setNavigationBarHidden:FALSE];
        REFrostedViewController *menu = [nav.viewControllers objectAtIndex:1];
        UINavigationController *global = menu.navigationController;
        UIViewController *productVC = [[global viewControllers] objectAtIndex:0];
        [((ProductViewController *)productVC) updateSegmentWithIndex:1];
        [self.navigationController setNavigationBarHidden:FALSE];
        [global popViewControllerAnimated:YES];
    } else {
        UINavigationController *navigationController = self.parentViewController.parentViewController.navigationController;
        REFrostedViewController *menu = [[navigationController viewControllers] objectAtIndex:1];
        UINavigationController *nav = (UINavigationController *)menu.contentViewController;
        [nav popToRootViewControllerAnimated:YES];
        
    }
}

@end
