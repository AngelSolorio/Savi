//
//  SubmissionViewController.m
//  Savi
//
//  Created by Sandra Guzman on 21/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "SubmissionViewController.h"

@implementation SubmissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Submission *submission = self.product.submission;
    self.labelSubmissionDate.text = submission.cofepris;
    self.labelPreventionDate.text = [NSString stringWithFormat:@"%@",submission.prevention_date];
    self.labelRegistrationDate.text = submission.registration;
    self.labelDuration.text = submission.duration;
    self.labelNumberPending.text = @"";
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

@end
