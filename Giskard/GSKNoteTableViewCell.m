//
//  GSKNoteTableViewCell.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/3.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "GSKNoteTableViewCell.h"
#import "View+MASAdditions.h"

@interface GSKNoteTableViewCell ()

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *createTimeLabel;
@property(nonatomic, strong) UILabel *notebookLabel;

@end

@implementation GSKNoteTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCell];
    }
    return self;
}

- (void)initCell {
    UIView *contentView = self.contentView;

    _titleLabel = [[UILabel alloc] init];
    _titleLabel.numberOfLines = 2;
    [contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).with.offset(16);
        make.top.equalTo(contentView).with.offset(8);
        make.right.equalTo(contentView).with.offset(-16);
    }];

    _createTimeLabel = [[UILabel alloc] init];
    [contentView addSubview:_createTimeLabel];
    [_createTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom);
        make.left.equalTo(_titleLabel.mas_left);
    }];

    _notebookLabel = [[UILabel alloc] init];
    [contentView addSubview:_notebookLabel];
    [_notebookLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_createTimeLabel.mas_top);
        make.left.equalTo(_createTimeLabel.mas_right).with.offset(16);
        make.bottom.equalTo(contentView).with.offset(-8);
    }];
}

- (void)updateCellWithNoteMeta:(GSKNoteMetaItem *)noteMeta {
    self.titleLabel.text = noteMeta.title;
    self.notebookLabel.text = noteMeta.notebookName;

    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:noteMeta.createdAt];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    self.createTimeLabel.text = [formatter stringFromDate:date];
}

@end
