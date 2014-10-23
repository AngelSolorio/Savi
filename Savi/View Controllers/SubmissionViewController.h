//
//  SubmissionViewController.h
//  Savi
//
//  Created by Sandra Guzman on 21/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "Submission.h"
#import "Product.h"

@interface SubmissionViewController : UIViewController

@property (nonatomic, strong) Product *product;
@property (weak, nonatomic) IBOutlet UILabel *labelSubmissionDate;
@property (weak, nonatomic) IBOutlet UILabel *labelPreventionDate;
@property (weak, nonatomic) IBOutlet UILabel *labelRegistrationDate;
@property (weak, nonatomic) IBOutlet UILabel *labelDuration;
@property (weak, nonatomic) IBOutlet UILabel *labelNumberPending;

- (IBAction)showMenu;

@end
