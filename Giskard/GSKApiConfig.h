//
//  GSKApiConfig.h
//  Giskard
//
//  Created by Dan Xin on 2017/3/14.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#ifndef GSKApiConfig_h
#define GSKApiConfig_h

typedef NS_ENUM(NSUInteger, GSKTokenStatus) {
    GSKTokenEmpty,
    GSKTokenExpired,
    GSKTokenValid
};

static NSString * const kGET = @"GET";
static NSString * const KPOST = @"POST";

// user default
static NSString * const GSKUserDefaultAccessToken = @"access_token";
static NSString * const GSKUserDefaultRefreshToken = @"refresh_token";
static NSString * const GSKUserDefaultExpiresDate = @"expires_date";

// app authentication
static NSString * const GSKClientId = @"";
static NSString * const GSKClientSecret = @"";
static NSString * const GSKRedirectUri = @"";
static NSString * const GSKCsrfProtectionString = @"";

// api url
static NSString * const GSKOAuthUrl = @"https://www.inoreader.com/oauth2/auth";
static NSString * const GSKObtainAccessAndRefreshToken = @"https://www.inoreader.com/oauth2/token";

#endif /* GSKApiConfig_h */
