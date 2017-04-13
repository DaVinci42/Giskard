//
//  NoteTableViewController.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/3.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "NoteTableViewController.h"
#import "GSKDataCore.h"

@interface NoteTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic) NSMutableArray<GSKNoteMetaItem *> *noteList;

@end

@implementation NoteTableViewController {
    GSKDataCore *dataCore;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.tableView.delegate = self;
        dataCore = [GSKDataCore sharedInstance];
        _noteList = [dataCore getAllNotes];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_noteList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];

    UIView *view = [[UIView alloc] initWithFrame:cell.bounds];
    view.backgroundColor = [UIColor lightGrayColor];
    [cell addSubview:view];

    UILabel *title = [[UILabel alloc] initWithFrame:cell.bounds];
    GSKNoteMetaItem *noteMeta = _noteList[(NSUInteger)indexPath.row];
    title.text = noteMeta.title;
    [cell addSubview:title];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GSKNoteMetaItem *noteMeta = _noteList[(NSUInteger) indexPath.row];
    NSMutableString *content = [dataCore getNoteContentWithNoteMeta:noteMeta];
    NSLog(@"click content: %@", content);
}
@end
