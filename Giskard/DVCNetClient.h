//
//  DVCNetClient.h
//  Giskard
//
//  Created by Dan Xin on 2017/3/9.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void(^ResponseHandlerBlock)(NSURLResponse *response, id responseObject, NSError *error);

@interface DVCNetClient : NSObject

+ (instancetype)sharedClient;

+ (NSMutableURLRequest *)generateRequest:(NSString *)url
                              withMethod:(NSString *)method
                          withParameters:(NSDictionary *)parameters;

- (void)performRequest:(NSString *)requestUrl
            methodType:(NSString *)method
            parameters:(NSDictionary *)parameters
       respondeHandler:(ResponseHandlerBlock)block;

- (void)performRequest:(NSString *)requestUrl
                header:(NSDictionary *)header
            methodType:(NSString *)method
            parameters:(NSDictionary *)parameters
       respondeHandler:(ResponseHandlerBlock)block;

+ (NSDictionary *)defaultHeader;

@property(nonatomic, strong) AFURLSessionManager *manager;

@end
