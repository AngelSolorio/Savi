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

@implementation SubmissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    detail.productDetails = self.product.detail;
}

@end
