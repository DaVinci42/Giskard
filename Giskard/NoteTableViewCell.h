//
//  NoteTableViewCell.h
//  Giskard
//
//  Created by Dan Xin on 2017/3/3.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteTableViewCell : UITableViewCell

@property(nonatomic, strong) UILabel *_titleLabel;

@property(nonatomic, strong) UILabel *_sourceLabel;

// FIXME: should use something like FlexLayout
@property(nonatomic, strong) UILabel *_tagLabel;

@end
