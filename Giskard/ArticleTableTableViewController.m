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

@property (nonatomic) NSMutableArray *articleArray;

@end

@implementation ArticleTableTableViewController

-(instancetype) initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStylePlain];
    self.tableView.delegate = self;
    
    _articleArray = [[NSMutableArray alloc] initWithObjects:@"Hello",
                     @"Nerd",
                     nil];
    return self;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_articleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    UIView *view = [[UIView alloc] initWithFrame:cell.bounds];
    view.backgroundColor = [UIColor lightGrayColor];
    [cell addSubview:view];
    
    UILabel *title = [[UILabel alloc] initWithFrame:cell.bounds];
    title.text = _articleArray[indexPath.row];
    [cell addSubview:title];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *content = _articleArray[indexPath.row];
    NSLog(@"click content: %@", content);
}
@end
