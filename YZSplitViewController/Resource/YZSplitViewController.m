//
//  YZSplitViewController.m
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/3.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "YZSplitViewController.h"

@interface YZSplitViewController ()

@end

@implementation YZSplitViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupDefaultValue];
    }
    return self;
}

- (instancetype)initWithMasterViewController:(UIViewController *)masterViewController detailViewController:(UIViewController *)detailViewController {
    self = [super init];
    if (self) {
        [self setupDefaultValue];
        [self setMasterViewController:masterViewController detailViewController:detailViewController];
    }
    return self;
}

- (void)setupDefaultValue {
    self.contentInsert = UIEdgeInsetsMake(15, 15, 15, 15);
    self.masterWidth = 390;
    self.separatorWidth = 20;
}

- (void)setMasterViewController:(UIViewController *)masterViewController detailViewController:(UIViewController *)detailViewController {
    _masterViewController = masterViewController;
    _detailViewController = detailViewController;
    
    _masterNavigationController = [[UINavigationController alloc] initWithRootViewController:_masterViewController];
    _detailNavigationController = [[UINavigationController alloc] initWithRootViewController:_detailViewController];
    
    [self setupUI];
}

- (void)setupUI {
    [self addChildViewController:self.masterViewController];
    [self addChildViewController:self.detailViewController];
    
    UIView *masterView = self.masterViewController.view;
    UIView *detailView = self.detailViewController.view;
    
    masterView.frame = CGRectMake(0, 0, 300, self.view.bounds.size.height);
    [self.view addSubview:masterView];
    
    detailView.frame = CGRectMake(300, 0, self.view.bounds.size.width - 300, self.view.bounds.size.height);
    [self.view addSubview:detailView];
    
    [self.view setNeedsLayout];
}

@end
