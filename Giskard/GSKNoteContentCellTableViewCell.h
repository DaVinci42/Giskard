//
// Created by Dan Xin on 2017/4/18.
// Copyright (c) 2017 Dan Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+DVC.h"
#import "GSKNoteCellItem.h"

static NSString *const kGSKNoteContentCellTableViewCell = @"kGSKNoteContentCellTableViewCell";

@interface GSKNoteContentCellTableViewCell : UITableViewCell

- (void)updateCellWithNoteContentCell:(GSKNoteCellItem *)noteCell;

@end