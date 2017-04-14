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

@interface GSKNoteTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic) NSMutableArray<GSKNoteMetaItem *> *noteList;

@end

@implementation GSKNoteTableViewController {
    GSKDataCore *dataCore;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.tableView.delegate = self;
        self.tableView.estimatedRowHeight = 42;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        [self.tableView registerClass:[GSKNoteTableViewCell class] forCellReuseIdentifier:kGSKNoteTableViewCellIdentifier];
        dataCore = [GSKDataCore sharedInstance];
        _noteList = [dataCore getAllNotes];
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
    NSLog(@"click note: %@", noteMeta);
}
@end
