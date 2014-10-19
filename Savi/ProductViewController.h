//
//  ProductViewController.h
//  Savi
//
//  Created by Sandra Guzman on 19/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    __weak IBOutlet UITableView *tableCompanies;
    NSArray *companyData;
}

@end
