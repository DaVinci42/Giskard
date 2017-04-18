//
// Created by Dan Xin on 2017/4/18.
// Copyright (c) 2017 Dan Xin. All rights reserved.
//

#import "GSKNoteContentViewController.h"
#import "GSKNoteContentCellTableViewCell.h"
#import "GSKDataCore.h"

@interface GSKNoteContentViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation GSKNoteContentViewController {

    GSKDataCore *_dataCore;
    GSKNoteContentItem *_noteContent;

}

- (instancetype)initWithNoteMeta:(GSKNoteMetaItem *)noteMeta {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.tableView.delegate = self;
        self.tableView.estimatedRowHeight = 42;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        [self.tableView registerClass:[GSKNoteContentCellTableViewCell class]
               forCellReuseIdentifier:kGSKNoteContentCellTableViewCell];
        _dataCore = [GSKDataCore sharedInstance];
        _noteContent = [_dataCore getNoteContentWithNoteMeta:noteMeta];
        NSLog(@"Note content: %@", _noteContent);
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _noteContent.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GSKNoteContentCellTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kGSKNoteContentCellTableViewCell forIndexPath:indexPath];
    GSKNoteCellItem *noteCellItem = _noteContent.cells[indexPath.row];
    [cell updateCellWithNoteContentCell:noteCellItem];
    return cell;
}

@end