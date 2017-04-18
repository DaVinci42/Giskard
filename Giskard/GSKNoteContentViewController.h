//
// Created by Dan Xin on 2017/4/18.
// Copyright (c) 2017 Dan Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSKNoteMetaItem.h"
#import "DVCUITableViewController.h"


@interface GSKNoteContentViewController : DVCUITableViewController

- (instancetype)initWithNoteMeta:(GSKNoteMetaItem *)noteMeta;

@end