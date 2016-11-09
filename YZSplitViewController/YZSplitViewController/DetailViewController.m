//
//  DetailViewController.m
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/3.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "DetailViewController.h"
#import "UIViewController+CloseView.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.closeView.hidden = YES;
    NSLog(@"222 %@", self.closeView);
//    self.closeView.lineColor = [UIColor redColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
     self.contentLabel.text = [NSString stringWithFormat:@"当前是第%ld个 ViewController", self.navigationController.viewControllers.count];
}

@end
