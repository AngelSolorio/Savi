//
//  DetailViewController.h
//  Savi
//
//  Created by Sandra Guzman on 21/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "ProductDetail.h"
#import "KeyDetail.h"

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *keyData;
}

@property (nonatomic, strong) ProductDetail *productDetails;
@property (weak, nonatomic) IBOutlet UILabel *labelComment;
@property (weak, nonatomic) IBOutlet UILabel *labelStatus;
@property (weak, nonatomic) IBOutlet UILabel *labelStatusUpdate;
@property (weak, nonatomic) IBOutlet UILabel *labelMedical;
@property (weak, nonatomic) IBOutlet UILabel *labelChemical;
@property (weak, nonatomic) IBOutlet UILabel *labelLegal;
@property (weak, nonatomic) IBOutlet UILabel *labelApi1;
@property (weak, nonatomic) IBOutlet UILabel *labelApi2;
@property (weak, nonatomic) IBOutlet UILabel *labelAcPrimary;
@property (weak, nonatomic) IBOutlet UILabel *labelAcSecondary;
@property (weak, nonatomic) IBOutlet UILabel *labelProdCompleted;
@property (weak, nonatomic) IBOutlet UILabel *labelKey;
@property (weak, nonatomic) IBOutlet UILabel *labelKeyDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelLab;
@property (weak, nonatomic) IBOutlet UILabel *labelUnits;
@property (weak, nonatomic) IBOutlet UILabel *labelValues;
@property (weak, nonatomic) IBOutlet UITableView *tableKey;


- (IBAction)showMenu;

@end
