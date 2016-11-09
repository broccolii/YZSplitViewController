//
//  YZSplitViewController.h
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/3.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import <UIKit/UIKit.h>

/****************** 注意! ***************
 左边的 Master View Controller 传进来 是不会包一层 NavigationController
 右边的 Detail View Controller 是会替你包一层 NavigationController 
 
 如果你要 Master 有 Push 的效果 请传进来一个 NavigationController 
 
 此控件有默认颜色: [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1]
***/

@class YZSplitDetailNavigationController;
@interface YZSplitViewController : UIViewController

@property (nonatomic, strong, readonly, nonnull) YZSplitDetailNavigationController *detailNavigationController;

@property (nonatomic, strong, readonly, nonnull) UIViewController *visibleDetailViewController;

@property (nonatomic, strong, readonly, nonnull) UIViewController *masterViewController;
@property (nonatomic, strong, readonly, nonnull) NSArray<UIViewController *> *detailViewControllers;

// default value: UIEdgeInsetsMake(15, 15, 15, 15)
@property (nonatomic, assign) UIEdgeInsets contentInsert;
// default value: 390
@property (nonatomic, assign) CGFloat masterWidth;
// default value: 20
@property (nonatomic, assign) CGFloat separatorWidth;

// 默认 detail view controller 是空 但是在 页面上 有一个 Clear 背景色的 UIViewController 要显示页面直接 Push 就可以
- (nonnull instancetype)initWithMasterViewController:(nonnull UIViewController *)masterViewController;

// 同上
- (nonnull instancetype)initWithMasterViewController:(nonnull UIViewController *)masterViewController
                                detailViewController:(nullable UIViewController *)detailViewController;

// 同上
- (void)setMasterViewController:(nonnull UIViewController *)masterViewController
           detailViewController:(nullable UIViewController *)detailViewController;

// 替换 detail view controller
- (void)replaceDetailViewController:(nonnull UIViewController *)viewController;

@end

@interface YZSplitDetailNavigationController : UINavigationController

@end
