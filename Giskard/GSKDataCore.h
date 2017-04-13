//
// Created by Dan Xin on 2017/4/12.
// Copyright (c) 2017 Dan Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSKNotebookMetaItem.h"
#import "GSKNoteMetaItem.h"

static NSString *const kGSKMainDirectory = @"Quiver.qvlibrary";
static NSString *const kGSKNotebookSuffix = @".qvnotebook";
static NSString *const kGSKNoteSuffix = @".qvnote";
static NSString *const kGSKMetaFileName = @"meta.json";
static NSString *const kGSKContentFileName = @"content.json";

typedef NS_ENUM(NSInteger, GSKLibraryType) {
    GSKTypeTest,
    GSKTypeDropbox
};

@interface GSKDataCore : NSObject

@property(nonatomic, assign) GSKLibraryType libraryType;

+ (GSKDataCore *)sharedInstance;

- (NSString *)getLibraryDirectory;

- (NSMutableArray<GSKNotebookMetaItem *> *)getNotebookList;

- (NSMutableArray<GSKNoteMetaItem *> *)getAllNotes;

- (NSMutableArray<GSKNoteMetaItem *> *)getNotesInNotebook:(GSKNotebookMetaItem *)notebookMeta;

- (NSMutableString *)getNoteContentWithNoteMeta:(GSKNoteMetaItem *)noteMeta;

@end
