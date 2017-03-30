//
//  GSKNetClient.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/14.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "GSKNetClient.h"
#import "GSKApiConfig.h"

@implementation GSKNetClient

// https://www.inoreader.com/oauth2/auth
//  ?client_id=[CLIENT_ID]
//  &redirect_uri=[REDIRECT_URI]
//  &response_type=code
//  &scope=[OPTIONAL_SCOPES]
//  &state=[CSRF_PROTECTION_STRING]
+ (NSURLRequest *)buildLoginRequest {
    NSString *url = GSKOAuthUrl;
    NSDictionary *parameters = @{@"client_id": GSKClientId,
            @"redirect_uri": GSKRedirectUri,
            @"response_type": @"code",
            @"scope": @"read",
            @"state": GSKCsrfProtectionString};
    return [GSKNetClient generateRequest:url
                              withMethod:kGET
                          withParameters:parameters];
}

+ (NSDictionary *)defaultHeader {
    return @{@"AppId": GSKClientId,
            @"AppKey": GSKClientSecret};
}

+ (void)obtainAccessAndRefreshToken:(NSString *)authorizationCode respondeHandler:(ResponseHandlerBlock)block {
    NSDictionary *parameters = @{@"code": authorizationCode,
            @"redirect_uri": GSKRedirectUri,
            @"client_id": GSKClientId,
            @"client_secret": GSKClientSecret,
            @"scope": @"read",
            @"grant_type": @"authorization_code"};

    return [[GSKNetClient sharedClient] performRequest:GSKObtainAccessAndRefreshToken
                                                header:@{@"Content-type": @"application/x-www-form-urlencoded"}
                                            methodType:@"POST"
                                            parameters:parameters
                                       respondeHandler:block];
}

@end
