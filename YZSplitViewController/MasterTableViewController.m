//
//  MasterTableViewController.m
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/3.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "MasterTableViewController.h"
#import "UIViewController+Split.h"
#import "DetailViewController.h"

@interface MasterTableViewController ()

@end

@implementation MasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"masterTableViewCell" forIndexPath:indexPath];
    NSString *titleString = nil;
    if (indexPath.row == 0) {
        titleString = @"Push Push Push!!!";
    } else if (indexPath.row == 1) {
        titleString = @"Replace Last View Controller";
    } else if (indexPath.row == 2) {
        titleString = @"Pop View Controller";
    } else if (indexPath.row == 3) {
        titleString = @"Pop To Root";
    }
    cell.textLabel.text = titleString;
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    if (indexPath.row == 0) {
        [self.yz_splitViewController.detailNavigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        vc.view.backgroundColor = [UIColor orangeColor];
        [self.yz_splitViewController.detailNavigationController replaceLastViewController:vc];
    }  else if (indexPath.row == 2) {
        [self.yz_splitViewController.detailNavigationController popViewControllerAnimated:YES];
    } else if (indexPath.row == 3) {
        [self.yz_splitViewController.detailNavigationController popToRootViewControllerAnimated:YES];
    }
}

@end
