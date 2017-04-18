//
// Created by Dan Xin on 2017/4/18.
// Copyright (c) 2017 Dan Xin. All rights reserved.
//

#import "DVCUtil.h"
#import <objc/runtime.h>


@implementation DVCUtil {

}

+ (NSString *)generateDescription:(NSObject *)object {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([object class], &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t prop = properties[i];
        const char *name = property_getName(prop);
        NSString *key = [NSString stringWithUTF8String:name];
        dictionary[key] = [object valueForKey:key];
    }
    return [NSString stringWithFormat:@"%@: %@", NSStringFromClass([object class]), dictionary.description];
}

@end