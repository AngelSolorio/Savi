//
//  ReviewViewController.m
//  Savi
//
//  Created by Sandra Guzman on 20/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "ReviewViewController.h"

@implementation ReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Review *review = self.product.review;
    self.labelThird.text = review.third;
    self.labelSubmissionDate.text = [NSString stringWithFormat:@"%@", review.date_third];
    self.labelStartfeedbackDate.text = [NSString stringWithFormat:@"%@", review.retro_first];
    self.labelEndFeedbackDate.text = [NSString stringWithFormat:@"%@", review.retro_last];
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

@end
