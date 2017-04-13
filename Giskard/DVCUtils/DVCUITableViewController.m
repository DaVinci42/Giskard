//
// Created by Dan Xin on 2017/4/13.
// Copyright (c) 2017 Dan Xin. All rights reserved.
//

#import "DVCUITableViewController.h"


@implementation DVCUITableViewController {

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    self.tableView.contentInset = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0);
}
@end