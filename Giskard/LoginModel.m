//
//  LoginModel.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/10.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "LoginModel.h"
#import "ApiConfig.h"
#import "DVCNetClient.h"

@implementation LoginModel

// https://www.inoreader.com/oauth2/auth
//  ?client_id=[CLIENT_ID]
//  &redirect_uri=[REDIRECT_URI]
//  &response_type=code
//  &scope=[OPTIONAL_SCOPES]
//  &state=[CSRF_PROTECTION_STRING]
+(NSURLRequest *)buildLoginRequest {
    NSString *url = oAuthUrl;
    NSDictionary *parameters = @{@"client_id": kClientId,
                                 @"redirect_uri": kRedirectUri,
                                 @"response_type": @"code",
                                 @"scope": @"read",
                                 @"state": kCSRFProtectionString};
    return [DVCNetClient generateRequest:url
                               withMethod:kGET
                           withParameters:parameters];
}

@end
