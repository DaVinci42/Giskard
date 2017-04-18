//
// Created by Dan Xin on 2017/4/12.
// Copyright (c) 2017 Dan Xin. All rights reserved.
//

#import "GSKDataCore.h"

static GSKDataCore *_instance;

@implementation GSKDataCore {

}

+ (GSKDataCore *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[GSKDataCore alloc] init];
    });
    return _instance;
}

- (NSString *)getLibraryDirectory {
    switch (_libraryType) {
        case GSKTypeTest:
            return [[NSBundle mainBundle] pathForResource:kGSKMainDirectory
                                                   ofType:nil];
        case GSKTypeDropbox:
            // TODO: dropbox
            return nil;
        default:
            return nil;
    }
}

- (NSMutableArray<GSKNotebookMetaItem *> *)getNotebookList {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *pathError;
    NSString *mainDirectory = [self getLibraryDirectory];
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
        id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingAllowFragments
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

- (NSMutableArray<GSKNoteMetaItem *> *)getAllNotes {
    NSMutableArray<GSKNoteMetaItem *> *noteList = [[NSMutableArray alloc] init];
    NSMutableArray<GSKNotebookMetaItem *> *notebookList = [self getNotebookList];
    for (GSKNotebookMetaItem *notebook in notebookList) {
        NSMutableArray<GSKNoteMetaItem *> *notes = [self getNotesInNotebook:notebook];
        [noteList addObjectsFromArray:notes];
    }
    return noteList;
}

- (NSMutableArray<GSKNoteMetaItem *> *)getNotesInNotebook:(GSKNotebookMetaItem *)notebookMeta {
    NSString *mainDirectory = [self getLibraryDirectory];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *notebookDir = [NSString stringWithFormat:@"%@/%@%@/", mainDirectory, notebookMeta.uuid, kGSKNotebookSuffix];
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

        NSString *metaPath = [NSString stringWithFormat:@"%@/%@%@/%@/%@", mainDirectory, notebookMeta.uuid, kGSKNotebookSuffix, note, kGSKMetaFileName];
        if (![fileManager fileExistsAtPath:metaPath]) {
            continue;
        }

        NSData *jsonData = [[NSData alloc] initWithContentsOfFile:metaPath];
        NSError *jsonError;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingAllowFragments
                                                          error:&jsonError];
        if (!jsonError && [jsonObject isKindOfClass:[NSDictionary class]]) {
            GSKNoteMetaItem *item = [[GSKNoteMetaItem alloc] init];
            item.title = jsonObject[@"title"];
            item.createdAt = [jsonObject[@"created_at"] integerValue];
            item.updatedAt = [jsonObject[@"updated_at"] integerValue];
            item.uuid = jsonObject[@"uuid"];
            item.tags = ((NSMutableArray *) jsonObject[@"tags"]);
            item.notebookName = notebookMeta.name;
            item.notebookUuid = notebookMeta.uuid;
            [noteMetaArray addObject:item];
        }
    }
    return noteMetaArray;
}

- (NSMutableString *)getNoteContentWithNoteMeta:(GSKNoteMetaItem *)noteMeta {
    NSString *contentPath = [NSString stringWithFormat:@"%@/%@%@/%@%@/%@", [self getLibraryDirectory],
                                                       noteMeta.notebookUuid, kGSKNotebookSuffix,
                                                       noteMeta.uuid, kGSKNoteSuffix,
                                                       kGSKContentFileName];
    return [[NSString stringWithContentsOfFile:contentPath
                                      encoding:NSUTF8StringEncoding
                                         error:nil] mutableCopy];
}

@end
