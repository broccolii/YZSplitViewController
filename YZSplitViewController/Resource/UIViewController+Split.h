//
//  UIViewController+Split.h
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/3.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZSplitViewController.h"

@interface UIViewController (Split)

@property (nonatomic, strong) YZSplitViewController *yz_splitViewController;

@end

@interface UINavigationController (Split)

- (void)replaceViewController:(UIViewController *)viewController;

@end

