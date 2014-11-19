//
//  SubmissionViewController.m
//  Savi
//
//  Created by Sandra Guzman on 21/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "SubmissionViewController.h"
#import "Utility.h"
#import "TypeDefs.h"
#import "DetailViewController.h"
#import "ProductViewController.h"

@implementation SubmissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *rightSwipe  =  [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    [rightSwipe setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:rightSwipe];
    
    Submission *submission = self.product.submission;
    self.labelSubmissionDate.text = submission.cofepris;
    self.labelPreventionDate.text = [Utility getStringFromDate:submission.prevention_date withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    self.labelRegistrationDate.text = submission.registration;
    self.labelDuration.text = submission.duration;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *detail = [segue destinationViewController];
    detail.title = self.product.name;
    detail.productDetails = self.product.detail;
}

#pragma mark - UISwipeGestureRecognizer Methods

- (IBAction)handleSwipeGesture:(UISwipeGestureRecognizer *)sender {
    UINavigationController *navigationController = self.parentViewController.parentViewController.navigationController;
    ProductViewController *productVC = [[navigationController viewControllers] objectAtIndex:0];
    [productVC updateSegmentWithIndex:3];
    [productVC.navigationController setNavigationBarHidden:FALSE];
    [navigationController popViewControllerAnimated:YES];
}

@end
