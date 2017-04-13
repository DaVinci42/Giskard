//
// Created by Dan Xin on 2017/4/13.
// Copyright (c) 2017 Dan Xin. All rights reserved.
//

#import "DVCUIViewController.h"


@implementation DVCUIViewController {

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.top = [UIApplication sharedApplication].statusBarFrame.size.height;
}
@end