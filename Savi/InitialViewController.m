//
//  ViewController.m
//  Savi
//
//  Created by Angel Solorio on 10/16/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "InitialViewController.h"
#import "Company.h"
#import "Product.h"

#define SUCCESS ((int) 5)
#define FAIL ((int) 6)

@interface InitialViewController ()

@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self syncing:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction Methods

- (IBAction)syncing:(id)sender {
    // Creates a progress control
    progressView = [MRProgressOverlayView showOverlayAddedTo:self.parentViewController.view
                                                       title:@"Sincronizando"
                                                        mode:MRProgressOverlayViewModeIndeterminate
                                                    animated:YES];
    // Loads the company options
    [Company getAllCompanies_completion:^(NSArray *companiesArray, NSError *error) {
        if (!error) {
            // Loads the all products
            [Product getAllProducts_completion:^(NSArray *productsArray, NSError *error) {
                [self checkingSyncStatus:SUCCESS];
            }];
        } else {
            [self checkingSyncStatus:FAIL];
        }
    }];
}

- (void)checkingSyncStatus:(int)status {
    [progressView dismiss:YES];

    // Creates a progress control
    progressView = [MRProgressOverlayView showOverlayAddedTo:self.view
                                                       title:@"Actualizado"
                                                        mode:status
                                                    animated:YES];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [progressView dismiss:YES];
    });
}

@end
