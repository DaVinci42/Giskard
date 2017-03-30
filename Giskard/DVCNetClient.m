//
//  DVCNetClient.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/9.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "DVCNetClient.h"

@interface DVCNetClient ()

@end

static DVCNetClient *sharedClient = nil;

static const NSString *kGet = @"GET";

static const NSString *kPost = @"POST";

static const NSDictionary *kHeader = nil;

@implementation DVCNetClient

- (instancetype)initPrivate {
    self = [super init];
    return self;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"try using [DVCNetClient sharedClient]"
                                 userInfo:nil];
}

+ (instancetype)sharedClient {
    if (!sharedClient) {
        sharedClient = [[DVCNetClient alloc] initPrivate];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sharedClient.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return sharedClient;
}

+ (NSMutableURLRequest *)generateRequest:(NSString *)url withMethod:(NSString *)method withParameters:(NSDictionary *)parameters {
    return [[AFHTTPRequestSerializer serializer] requestWithMethod:method
                                                         URLString:url
                                                        parameters:parameters
                                                             error:nil];
}

+ (NSDictionary *)defaultHeader {
    return nil;
}

- (void)performRequest:(NSString *)requestUrl methodType:(NSString *)method parameters:(NSDictionary *)parameters respondeHandler:(ResponseHandlerBlock)block {
    [self performRequest:requestUrl
                  header:nil
              methodType:method
              parameters:parameters
         respondeHandler:block];
}

- (void)performRequest:(NSString *)requestUrl header:(NSDictionary *)header methodType:(NSString *)method parameters:(NSDictionary *)parameters respondeHandler:(ResponseHandlerBlock)block {

    NSURL *url = [NSURL URLWithString:requestUrl];
    NSMutableURLRequest *request = parameters ? [DVCNetClient generateRequest:requestUrl
                                                                   withMethod:method
                                                               withParameters:parameters]
            : [[NSMutableURLRequest alloc] initWithURL:url];
    NSMutableDictionary *requestHeader = [[DVCNetClient defaultHeader] copy];
    if (header) {
        [requestHeader addEntriesFromDictionary:header];
    }
    [request setAllHTTPHeaderFields:requestHeader];
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request
                                                     completionHandler:block];
    [dataTask resume];
}


@end
