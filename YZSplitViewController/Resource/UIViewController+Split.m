//
//  UIViewController+Split.m
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/3.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "UIViewController+Split.h"
#import "YZSplitViewController.h"
#import <objc/runtime.h>

@implementation UIViewController (Split)
@dynamic yz_splitViewController;

- (YZSplitViewController *)yz_splitViewController {
    return (YZSplitViewController *)objc_getAssociatedObject(self, @selector(yz_splitViewController));
}

- (void)setYz_splitViewController:(YZSplitViewController *)yz_splitViewController {
    objc_setAssociatedObject(self, @selector(yz_splitViewController), yz_splitViewController, OBJC_ASSOCIATION_ASSIGN);
}

@end
