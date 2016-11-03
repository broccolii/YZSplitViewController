//
//  UIViewController+Split.m
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/3.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "UIViewController+Split.h"
#import <objc/runtime.h>

@implementation UIViewController (Split)
@dynamic yz_splitViewController;
@dynamic yz_topMasterViewController;
@dynamic yz_topDetailViewController;

- (YZSplitViewController *)yz_splitViewController {
    return (YZSplitViewController *)objc_getAssociatedObject(self, @selector(yz_splitViewController));
}

- (void)setYz_splitViewController:(YZSplitViewController *)yz_splitViewController {
    objc_setAssociatedObject(self, @selector(yz_splitViewController), yz_splitViewController, OBJC_ASSOCIATION_ASSIGN);
}

- (UIViewController *)yz_topMasterViewController {
    return self.yz_splitViewController.masterNavigationController.topViewController;
}

- (UIViewController *)yz_topDetailController {
    return self.yz_splitViewController.detailNavigationController.topViewController;
}

@end

@implementation UINavigationController (Split)

- (void)yz_replaceLastViewController:(UIViewController *)viewController {
    NSMutableArray *viewControllers = [self.viewControllers mutableCopy];
    [viewControllers removeObject:viewControllers.lastObject];
    [viewControllers addObject:viewController];
    self.viewControllers = viewControllers;
}

@end
