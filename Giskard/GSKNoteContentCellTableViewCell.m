//
// Created by Dan Xin on 2017/4/18.
// Copyright (c) 2017 Dan Xin. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "GSKNoteContentCellTableViewCell.h"


@interface GSKNoteContentCellTableViewCell ()

@property(nonatomic, strong) UILabel *cellTypeLabel;
@property(nonatomic, strong) UITextView *contentTextView;

@end

@implementation GSKNoteContentCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCell];
    }
    return self;
}

- (void)initCell {
    UIView *contentView = self.contentView;
    _cellTypeLabel = [[UILabel alloc] init];
    [contentView addSubview:_cellTypeLabel];
    [_cellTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).with.offset(8);
        make.right.equalTo(contentView).with.offset(8);
        make.top.equalTo(contentView).with.offset(8);
    }];

    _contentTextView = [[UITextView alloc] init];
    [contentView addSubview:_contentTextView];
    [_contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cellTypeLabel.mas_bottom).with.offset(4);
        make.left.equalTo(contentView).with.offset(8);
        make.right.equalTo(contentView).with.offset(8);
        make.bottom.equalTo(contentView).with.offset(-8);
    }];
}

- (void)updateCellWithNoteContentCell:(GSKNoteCellItem *)noteCell {
    NSLog(@"cell: %@", noteCell);
    _cellTypeLabel.text = noteCell.type;
    _contentTextView.text = noteCell.data;
}

@end
