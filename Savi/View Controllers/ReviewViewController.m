//
//  ReviewViewController.m
//  Savi
//
//  Created by Sandra Guzman on 20/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "ReviewViewController.h"
#import "Utility.h"
#import "TypeDefs.h"
#import "DetailViewController.h"
#import "ProductViewController.h"

@implementation ReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *rightSwipe  =  [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    [rightSwipe setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:rightSwipe];
    
    Review *review = self.product.review;
    self.labelThird.text = review.third;
    self.labelSubmissionDate.text = [Utility getStringFromDate:review.date_third  withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    self.labelStartfeedbackDate.text = [Utility getStringFromDate:review.retro_first  withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    self.labelEndFeedbackDate.text = [Utility getStringFromDate:review.retro_last  withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    self.labelDeliveryDate.text = review.report;
    self.labelEstimatedDate.text = review.cofepris;
    self.labelDuration.text = review.duration;
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
    [productVC updateSegmentWithIndex:2];
    [productVC.navigationController setNavigationBarHidden:FALSE];
    [navigationController popViewControllerAnimated:YES];
}

@end
