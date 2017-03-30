//
//  GSKNetClient.h
//  Giskard
//
//  Created by Dan Xin on 2017/3/14.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVCNetClient.h"

@interface GSKNetClient : DVCNetClient

+ (NSURLRequest *)buildLoginRequest;

+ (void)obtainAccessAndRefreshToken:(NSString *)authorizationCode
                    respondeHandler:(ResponseHandlerBlock)block;

@end
