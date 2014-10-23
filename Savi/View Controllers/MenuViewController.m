//
//  MenuViewController.m
//  Savi
//
//  Created by Sandra Guzman on 20/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "MenuViewController.h"
#import "ProductViewController.h"
#import "InitialViewController.h"

@implementation MenuViewController

#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductViewController *productViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"productView"];
    [productViewController setIndex:indexPath.row + 1];
    [self.navigationController setNavigationBarHidden:FALSE];
    
    if ([self.parentViewController isKindOfClass:[InitialViewController class]]) {
        [self.navigationController pushViewController:productViewController animated:YES];
    } else {
        UINavigationController *nav = self.parentViewController.parentViewController.navigationController;
        ProductViewController *viewController = [nav.viewControllers objectAtIndex:1];
        [viewController setIndex:indexPath.row + 1];
        [nav popViewControllerAnimated:YES];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setBackgroundColor:[UIColor clearColor]];
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    // Sets the TableViewFooter
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 1.0, 1.0, 1.0)];
    footerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = footerView;
}

- (void)viewDidLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
