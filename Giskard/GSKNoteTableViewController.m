//
//  GSKNoteTableViewController.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/3.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "GSKNoteTableViewController.h"
#import "GSKDataCore.h"
#import "GSKNoteTableViewCell.h"
#import "GSKNoteContentViewController.h"

@interface GSKNoteTableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation GSKNoteTableViewController {

    NSMutableArray<GSKNoteMetaItem *> *_noteList;
    GSKDataCore *_dataCore;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.tableView.delegate = self;
        self.tableView.estimatedRowHeight = 42;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        [self.tableView registerClass:[GSKNoteTableViewCell class] forCellReuseIdentifier:kGSKNoteTableViewCellIdentifier];
        _dataCore = [GSKDataCore sharedInstance];
        _noteList = [_dataCore getAllNotes];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_noteList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GSKNoteTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kGSKNoteTableViewCellIdentifier
                                                                      forIndexPath:indexPath];
    GSKNoteMetaItem *noteMeta = _noteList[indexPath.row];
    [cell updateCellWithNoteMeta:noteMeta];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GSKNoteMetaItem *noteMeta = _noteList[indexPath.row];
    [self presentViewController:[[GSKNoteContentViewController alloc] initWithNoteMeta:noteMeta]
                       animated:YES
                     completion:nil];
}
@end
