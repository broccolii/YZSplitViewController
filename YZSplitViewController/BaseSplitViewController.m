//
//  BaseSplitViewController.m
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/2.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "BaseSplitViewController.h"
#import "UIViewController+Split.h"

@interface BaseSplitViewController ()

@end

@implementation BaseSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIViewController *masterTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MasterTableViewController"];
    UIViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    [self setMasterViewController:masterTableViewController
             detailViewController:detailViewController];
}

@end
