//
//  GSKDataProtocal.h
//  Giskard
//
//  Created by Dan Xin on 2017/4/12.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSKNotebookMetaItem.h"
#import "GSKNoteMetaItem.h"

static NSString *const kGSKMainDirectory = @"Quiver.qvlibrary";
static NSString *const kGSKNotebookSuffix = @".qvnotebook";
static NSString *const kGSKNoteSuffix = @".qvnote";
static NSString *const kGSKMetaFileName = @"meta.json";
static NSString *const kGSKContentFileName = @"content.json";



@protocol GSKDataProtocal <NSObject>

+ (NSString *)getMainDirectory;

+ (NSMutableArray<GSKNotebookMetaItem *> *)getNotebookList;

+ (NSMutableArray<GSKNoteMetaItem *> *)getNotesInNotebook:(GSKNotebookMetaItem *)notebookMetaItem;

@end
