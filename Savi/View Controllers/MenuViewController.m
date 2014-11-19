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
#import "REFrostedViewController.h"

@implementation MenuViewController

#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductViewController *productViewController;
    UINavigationController *navigationController;
    
    if ([self.parentViewController isKindOfClass:[InitialViewController class]]) {
        productViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"productView"];
        productViewController.index = indexPath.row + 1;
        [self.navigationController setNavigationBarHidden:FALSE];
        navigationController = [[UINavigationController alloc] initWithRootViewController:productViewController];
        
        REFrostedViewController *root = [[REFrostedViewController alloc]
                                         initWithContentViewController:navigationController
                                         menuViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"menuController"]];
        // Hides the Navigation Bar
        [self.navigationController setNavigationBarHidden:YES];
        [self.navigationController pushViewController:root animated:YES];
    } else {
        navigationController = self.parentViewController.parentViewController.navigationController;
        UIViewController *viewcontroller = [[navigationController viewControllers] objectAtIndex:0];
        
        if ([viewcontroller isKindOfClass:[ProductViewController class]]) {
            [((ProductViewController *)viewcontroller) updateSegmentWithIndex:indexPath.row + 1];
            [self.navigationController setNavigationBarHidden:FALSE];
            [navigationController popViewControllerAnimated:YES];
        } else {
            REFrostedViewController *view = [navigationController.viewControllers objectAtIndex:1];
            productViewController = [[ (UINavigationController *)view.contentViewController viewControllers] firstObject];
            [productViewController updateSegmentWithIndex:indexPath.row + 1];
            [view hideMenuViewController];
        }
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
