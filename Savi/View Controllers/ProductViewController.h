//
//  ProductViewController.h
//  Savi
//
//  Created by Sandra Guzman on 19/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate> {
    __weak IBOutlet UITableView *tableCompanies;
    __weak IBOutlet UITableView *tableProducts;
    __weak IBOutlet UISegmentedControl *segmentFilters;
    NSArray *companyData;
    NSArray *productData;
    NSMutableArray *copyCompanyData;
    NSMutableArray *copyProductData;
    NSArray *filterProductData;
    BOOL searchingCompany;
    BOOL searchingProduct;
}

@property (weak, nonatomic) IBOutlet UISearchBar *searchBarCompany;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBarProduct;
@property (nonatomic, assign) NSInteger index;

- (IBAction)valueChangedSegment:(id)sender;

@end
