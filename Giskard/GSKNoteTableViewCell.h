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

- (void)updateCellWithNoteMeta:(GSKNoteMetaItem *)noteMeta;

@end
