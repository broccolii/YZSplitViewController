//
//  BaseSplitViewController.m
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/2.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "BaseSplitViewController.h"

@interface BaseSplitViewController ()

@end

@implementation BaseSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setMasterViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"MasterTableViewController"]
             detailViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"]];
}

@end
