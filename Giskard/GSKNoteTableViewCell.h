//
//  GSKNoteTableViewCell.h
//  Giskard
//
//  Created by Dan Xin on 2017/3/3.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+DVC.h"
#import "GSKNoteMetaItem.h"

static NSString *const kGSKNoteTableViewCellIdentifier = @"kGSKNoteTableViewCellIdentifier";

@interface GSKNoteTableViewCell : UITableViewCell

@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UILabel *createTimeLabel;

@property(nonatomic, strong) UIImageView *notebookImageView;

@property(nonatomic, strong) UILabel *notebookLabel;

- (void)updateCellWithNoteMeta:(GSKNoteMetaItem *)noteMeta;

@end
