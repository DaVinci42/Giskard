//
//  ArticleTableTableViewController.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/3.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "ArticleTableTableViewController.h"
#import <UIKit/UITableView.h>

@interface ArticleTableTableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ArticleTableTableViewController

-(instancetype) initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStylePlain];
    self.tableView.delegate = self;
    return self;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    UIView *view = [[UIView alloc] initWithFrame:cell.bounds];
    view.backgroundColor = [UIColor lightGrayColor];
    [cell addSubview:view];
    
    UILabel *title = [[UILabel alloc] initWithFrame:cell.bounds];
    title.text = @"Hello Nerd";
    [cell addSubview:title];
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
@end
