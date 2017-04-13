//
// Created by Dan Xin on 2017/4/12.
// Copyright (c) 2017 Dan Xin. All rights reserved.
//

#import "GSKTestCore.h"


@implementation GSKTestCore {

}

+ (NSString *)getMainDirectory {
    return [[NSBundle mainBundle] pathForResource:kGSKMainDirectory
                                           ofType:nil];
}

+ (NSMutableArray<GSKNotebookMetaItem *> *)getNotebookList {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *pathError;
    NSString *mainDirectory = [self getMainDirectory];
    NSArray *notebookFiles = [fileManager contentsOfDirectoryAtPath:mainDirectory
                                                              error:&pathError];
    NSMutableArray *notebookMetaArray = [[NSMutableArray alloc] init];
    if (pathError) {
        return notebookMetaArray;
    }

    for (NSString *notebook in notebookFiles) {
        if (![notebook hasSuffix:kGSKNotebookSuffix]) {
            continue;
        }
        NSString *metaPath = [NSString stringWithFormat:@"%@/%@/%@", mainDirectory, notebook, kGSKMetaFileName];
        if (![fileManager fileExistsAtPath:metaPath]) {
            continue;
        }

        NSData *jsonData = [[NSData alloc] initWithContentsOfFile:metaPath];
        NSError *jsonError;
        id jsonObject = [NSJSONSerialization dataWithJSONObject:jsonData
                                                        options:NSJSONWritingPrettyPrinted
                                                          error:&jsonError];
        if (!jsonError && [jsonObject isKindOfClass:[NSDictionary class]]) {
            GSKNotebookMetaItem *item = [[GSKNotebookMetaItem alloc] init];
            item.name = jsonObject[@"name"];
            item.uuid = jsonObject[@"uuid"];
            [notebookMetaArray addObject:item];
        }
    }
    return notebookMetaArray;
}

+ (NSMutableArray<GSKNoteMetaItem *> *)getNotesInNotebook:(GSKNotebookMetaItem *)notebookMetaItem {
    NSString *mainDirectory = [self getMainDirectory];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *notebookDir = [NSString stringWithFormat:@"%@/%@%@/", mainDirectory, notebookMetaItem.uuid, kGSKNotebookSuffix];
    NSError *pathError;
    NSArray *noteFiles = [fileManager contentsOfDirectoryAtPath:notebookDir
                                                          error:&pathError];
    NSMutableArray *noteMetaArray = [[NSMutableArray alloc] init];
    if (pathError) {
        return noteMetaArray;
    }

    for (NSString *note in noteFiles) {
        if (![note hasSuffix:kGSKNoteSuffix]) {
            continue;
        }

        NSString *metaPath = [NSString stringWithFormat:@"%@/%@%@/%@/%@", mainDirectory, notebookMetaItem.uuid, kGSKNotebookSuffix, note, kGSKMetaFileName];
        if (![fileManager fileExistsAtPath:metaPath]) {
            continue;
        }

        NSData *jsonData = [[NSData alloc] initWithContentsOfFile:metaPath];
        NSError *jsonError;
        id jsonObject = [NSJSONSerialization dataWithJSONObject:jsonData
                                                        options:NSJSONWritingPrettyPrinted
                                                          error:&jsonError];
        if (!jsonError && [jsonObject isKindOfClass:[NSDictionary class]]) {
            GSKNoteMetaItem *item = [[GSKNoteMetaItem alloc] init];
            item.title = jsonObject[@"title"];
            item.created_at = [jsonObject[@"created_at"] integerValue];
            item.updated_at = [jsonObject[@"updated_at"] integerValue];
            item.uuid = jsonObject[@"uuid"];
            item.tags = ((NSMutableArray *) jsonObject[@"tags"]);
            [noteMetaArray addObject:item];
        }
    }
    return noteMetaArray;
}

@end