//
//  ArticleTableTableViewController.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/3.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "ArticleTableTableViewController.h"
#import <UIKit/UITableView.h>

@interface ArticleTableTableViewController () <UITableViewDataSource>

@end

@implementation ArticleTableTableViewController

-(instancetype) initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStylePlain];
    return self;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


@end
