//
//  MasterTableViewController.m
//  YZSplitViewController
//
//  Created by Broccoli on 2016/11/3.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "MasterTableViewController.h"
#import "UIViewController+Split.h"

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
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 1) {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        vc.view.backgroundColor = [UIColor redColor];
        NSLog(@"%@", self.yz_splitViewController.detailNavigationController.topViewController);
        [self.yz_splitViewController.detailNavigationController replaceViewController:vc];
    } else if (indexPath.row == 2) {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        vc.view.backgroundColor = [UIColor blueColor];
        NSLog(@"%@", self.yz_splitViewController.detailNavigationController.topViewController);
        [self.yz_splitViewController.detailNavigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 3) {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        vc.view.backgroundColor = [UIColor blueColor];
        NSLog(@"%@", self.yz_splitViewController.detailNavigationController.topViewController);
        [self.yz_splitViewController.detailNavigationController popViewControllerAnimated:YES];
    }
}

@end
