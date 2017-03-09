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

+(instancetype)sharedClient;

-(void)performGetRequest:(NSString *)requestUrl
     withRespondeHandler:(ResponseHandlerBlock) block;

@property(nonatomic, strong) AFURLSessionManager *manager;

@end
