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
    self.labelStartfeedbackDate.text = [NSString stringWithFormat:@"%@", review.retro_first];
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
