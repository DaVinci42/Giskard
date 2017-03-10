//
//  DVCNetClient.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/9.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "DVCNetClient.h"
#import <AFNetworking/AFNetworking.h>

@interface DVCNetClient ()

@end

static DVCNetClient *sharedClient = nil;

@implementation DVCNetClient

+(instancetype)sharedClient {
    if (!sharedClient) {
        sharedClient = [[DVCNetClient alloc] initPrivate];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sharedClient.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return sharedClient;
}

+(NSURLRequest *)generateRequest:(NSString *)url withMethod:(NSString *)method withParameters:(NSDictionary *)parameters {
    return [[AFHTTPRequestSerializer serializer] requestWithMethod:method
                                                         URLString:url
                                                        parameters:parameters
                                                             error:nil];
}

-(instancetype)initPrivate {
    self = [super init];
    return self;
}

-(instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"try using [DVCNetClient sharedClient]"
                                 userInfo:nil];
}

-(void)performGetRequest:(NSString *)requestUrl withRespondeHandler:(ResponseHandlerBlock)block {
    NSURL *url = [NSURL URLWithString:requestUrl];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:block];
    [dataTask resume];
}
@end
