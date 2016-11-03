//
//  YZSplitViewController.h
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/3.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZSplitViewController : UIViewController

@property (nonatomic, strong, readonly) UINavigationController *masterNavigationController;
@property (nonatomic, strong, readonly) UINavigationController *detailNavigationController;

@property (nonatomic, strong, readonly) UIViewController *masterViewController;
@property (nonatomic, strong, readonly) UIViewController *detailViewController;

@property (nonatomic, assign) UIEdgeInsets contentInsert;
@property (nonatomic, assign) CGFloat masterWidth;
@property (nonatomic, assign) CGFloat separatorWidth;

- (void)setMasterViewController:(UIViewController *)masterViewController detailViewController:(UIViewController *)detailViewController;

@end
