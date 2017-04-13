//
//  GSKHomeViewController.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/3.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "GSKHomeViewController.h"
#import "GSKNoteTableViewController.h"

@interface GSKHomeViewController ()

@property(nonatomic, strong) GSKNoteTableViewController *noteTableViewController;

@end


@implementation GSKHomeViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _noteTableViewController = [[GSKNoteTableViewController alloc] init];
    [self presentViewController:_noteTableViewController
                       animated:YES
                     completion:nil];
}

@end
