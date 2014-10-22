//
//  SubmissionViewController.m
//  Savi
//
//  Created by Sandra Guzman on 21/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "SubmissionViewController.h"

@implementation SubmissionViewController

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
