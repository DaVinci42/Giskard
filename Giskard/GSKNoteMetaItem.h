//
// Created by Dan Xin on 2017/4/12.
// Copyright (c) 2017 Dan Xin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GSKNoteMetaItem : NSObject

@property(nonatomic, strong) NSMutableString *title;
@property(nonatomic, strong) NSString *uuid;
@property(nonatomic, strong) NSMutableArray<NSString *> *tags;
@property(nonatomic, assign) NSInteger createdAt;
@property(nonatomic, assign) NSInteger updatedAt;

@property (nonatomic, strong) NSString *notebookName;
@property (nonatomic, strong) NSString *notebookUuid;

@end