//
//  ReviewViewController.h
//  Savi
//
//  Created by Sandra Guzman on 20/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

@interface ReviewViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelThird;
@property (weak, nonatomic) IBOutlet UILabel *labelSubmissionDate;
@property (weak, nonatomic) IBOutlet UILabel *labelStartfeedbackDate;
@property (weak, nonatomic) IBOutlet UILabel *labelEndFeedbackDate;
@property (weak, nonatomic) IBOutlet UILabel *labelDeliveryDate;
@property (weak, nonatomic) IBOutlet UILabel *labelEstimatedDate;
@property (weak, nonatomic) IBOutlet UILabel *labelDuration;

- (IBAction)showMenu;

@end
