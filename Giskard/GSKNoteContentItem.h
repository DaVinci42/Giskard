//
// Created by Dan Xin on 2017/4/12.
// Copyright (c) 2017 Dan Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSKNoteCellItem.h"


@interface GSKNoteContentItem : NSObject

@property(nonatomic, strong) NSMutableString *title;
@property(nonatomic, strong) NSMutableArray<GSKNoteCellItem *> *cells;

@end