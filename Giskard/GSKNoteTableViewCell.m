//
//  GSKNoteTableViewCell.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/3.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "GSKNoteTableViewCell.h"

@implementation GSKNoteTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // TODO: update cell using autolayout
    }
    return self;
}

- (void)updateCellWithNoteMeta:(GSKNoteMetaItem *)noteMeta {
    self.titleLabel.text = noteMeta.title;
    self.notebookLabel.text = noteMeta.notebookName;

    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:noteMeta.created_at];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YY-MM-dd";
    self.createTimeLabel.text = [formatter stringFromDate:date];
}

@end
