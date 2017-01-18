//
//  YZSplitViewController.m
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/3.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "YZSplitViewController.h"
#import "UIViewController+Split.h"
#import "UIViewController+CloseView.h"

@interface YZSplitViewController ()

@property (nonatomic, strong) UIViewController *detailViewController;

@end

@implementation YZSplitViewController

#pragma mark - Initializers
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

- (nonnull instancetype)initWithMasterViewController:(nonnull UIViewController *)masterViewController {
    self = [super init];
    if (self) {
        [self setupDefaultValue];
        [self setMasterViewController:masterViewController detailViewController:nil];
    }
    return self;
}

- (instancetype)initWithMasterViewController:(UIViewController *)masterViewController
                        detailViewController:(UIViewController *)detailViewController {
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
    
    NSAssert(masterViewController != nil, @"masterViewController is nil!!!");
    
    masterViewController.yz_splitViewController = self;
    detailViewController.yz_splitViewController = self;
    
    _masterViewController = masterViewController;
    _detailViewController = detailViewController;
    
    if (!_detailViewController) {
        UIViewController *clearViewController = [[UIViewController alloc] init];
        clearViewController.view.backgroundColor = [UIColor clearColor];
        _detailViewController = clearViewController;
    }
    if (_detailNavigationController) {
        [_detailNavigationController removeFromParentViewController];
        _detailNavigationController = nil;
    }
    _detailNavigationController = [[YZSplitDetailNavigationController alloc] initWithRootViewController:_detailViewController];
    
    [_detailNavigationController setNavigationBarHidden:YES];
    
    
    [self addChildViewController:masterViewController];
    [self addChildViewController:self.detailNavigationController];
    
    
    [self layoutSubview];
}

- (void)layoutSubview {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];
    
    UIView *masterView = self.masterViewController.view;
    [self.view addSubview:masterView];
    
    UIView *detailView = self.detailNavigationController.view;
    [self.view addSubview:detailView];
    
    [masterView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *topMasterContraint = [NSLayoutConstraint constraintWithItem:masterView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:self.contentInsert.top];
    NSLayoutConstraint *bottomMasterContraint = [NSLayoutConstraint constraintWithItem:masterView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-self.contentInsert.bottom];
    NSLayoutConstraint *leftMasterContraint = [NSLayoutConstraint constraintWithItem:masterView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:self.contentInsert.left];
    NSLayoutConstraint *widthMasterContraint = [NSLayoutConstraint constraintWithItem:masterView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.masterWidth];
    
    NSArray *masterViewContraints = @[topMasterContraint, bottomMasterContraint, leftMasterContraint, widthMasterContraint];
    [NSLayoutConstraint activateConstraints:masterViewContraints];
    
    [detailView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *topDetailContraint = [NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:self.contentInsert.top];
    NSLayoutConstraint *bottomDetailContraint = [NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-self.contentInsert.bottom];
    NSLayoutConstraint *rightDetailContraint = [NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-self.contentInsert.right];
    NSLayoutConstraint *leftDetailContraint = [NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:masterView attribute:NSLayoutAttributeRight multiplier:1.0 constant:self.separatorWidth];

    NSArray *detailViewContraints = @[topDetailContraint, bottomDetailContraint, rightDetailContraint, leftDetailContraint];
    [NSLayoutConstraint activateConstraints:detailViewContraints];
    
    [self.view setNeedsLayout];
}

- (void)replaceDetailViewController:(nonnull UIViewController *)viewController {
    viewController.closeView.hidden = NO;
    viewController.yz_splitViewController = self.detailNavigationController.viewControllers[0].yz_splitViewController;
    self.detailNavigationController.viewControllers = @[viewController];
}

- (void)dealloc {
    [self.detailNavigationController removeObserver:self forKeyPath:@"viewControllers"];
}

#pragma mark - getter
- (UIViewController *)visibleDetailViewController {
    return self.detailNavigationController.visibleViewController;
}

- (NSArray<UIViewController *> *)detailViewControllers {
    return self.detailNavigationController.viewControllers;
}

@end

@implementation YZSplitDetailNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.closeView.hidden = NO;
        viewController.yz_splitViewController = self.viewControllers[0].yz_splitViewController;
    }
    [super pushViewController:viewController animated:animated];
}

@end
