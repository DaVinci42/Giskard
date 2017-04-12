//
//  HomeViewController.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/3.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "HomeViewController.h"
#import "NoteTableViewController.h"

@interface HomeViewController ()

@property(nonatomic, strong) NoteTableViewController *noteTableViewController;

@end


@implementation HomeViewController

- (void)viewDidLoad {
    _noteTableViewController = [[NoteTableViewController alloc] init];
    [self.view addSubview:_noteTableViewController.view];
}

@end
