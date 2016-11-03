//
//  YZSplitViewController.m
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/3.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "YZSplitViewController.h"
#import "UIViewController+Split.h"

@interface YZSplitViewController ()

@end

@implementation YZSplitViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupDefaultValue];
    }
    return self;
}

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
    
    masterViewController.yz_splitViewController = self;
    detailViewController.yz_splitViewController = self;
    
    _masterViewController = masterViewController;
    _detailViewController = detailViewController;
    
    _masterNavigationController = [[UINavigationController alloc] initWithRootViewController:_masterViewController];
    
    if (!_detailViewController) {
        UIViewController *clearViewController = [[UIViewController alloc] init];
        clearViewController.view.backgroundColor = [UIColor clearColor];
        _detailViewController = clearViewController;
    }
    
    _detailNavigationController = [[UINavigationController alloc] initWithRootViewController:_detailViewController];
    [_masterNavigationController setNavigationBarHidden:YES];
    [_detailNavigationController setNavigationBarHidden:YES];
    
    [self layoutSubview];
}

- (void)layoutSubview {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];
    
    [self addChildViewController:self.masterNavigationController];
    UIView *masterView = self.masterNavigationController.view;
    [self.view addSubview:masterView];
    [masterView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *topMasterContraint = [NSLayoutConstraint constraintWithItem:masterView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:self.contentInsert.top];
    NSLayoutConstraint *bottomMasterContraint = [NSLayoutConstraint constraintWithItem:masterView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-self.contentInsert.bottom];
    NSLayoutConstraint *leftMasterContraint = [NSLayoutConstraint constraintWithItem:masterView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:self.contentInsert.left];
    NSLayoutConstraint *widthMasterContraint = [NSLayoutConstraint constraintWithItem:masterView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.masterWidth];
    
    NSArray *masterViewContraints = @[topMasterContraint, bottomMasterContraint, leftMasterContraint, widthMasterContraint];
    [self.view addConstraints: masterViewContraints];
    
    
    [self addChildViewController:self.detailNavigationController];
    UIView *detailView = self.detailNavigationController.view;
    [self.view addSubview:detailView];
    [detailView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *topDetailContraint = [NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:self.contentInsert.top];
    NSLayoutConstraint *bottomDetailContraint = [NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-self.contentInsert.bottom];
    NSLayoutConstraint *rightDetailContraint = [NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-self.contentInsert.right];
    NSLayoutConstraint *widthDetailContraint = [NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:masterView attribute:NSLayoutAttributeRight multiplier:1.0 constant:self.separatorWidth];
    
    NSArray *detailViewContraints = @[topDetailContraint, bottomDetailContraint, rightDetailContraint, widthDetailContraint];
    [self.view addConstraints: detailViewContraints];
    
    [self.view setNeedsLayout];
}

@end
