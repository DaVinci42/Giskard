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

static NSString *const kGET = @"GET";
static NSString *const KPOST = @"POST";

// user default
static NSString *const GSKUserDefaultAccessToken = @"access_token";
static NSString *const GSKUserDefaultRefreshToken = @"refresh_token";
static NSString *const GSKUserDefaultExpiresDate = @"expires_date";

// app authentication
static NSString *const GSKClientId = @"";
static NSString *const GSKClientSecret = @"";
static NSString *const GSKRedirectUri = @"";
static NSString *const GSKCsrfProtectionString = @"";

// api url
static NSString *const GSKOAuthUrl = @"https://www.inoreader.com/oauth2/auth";
static NSString *const GSKObtainAccessAndRefreshToken = @"https://www.inoreader.com/oauth2/token";

static NSString *const GSKUserInfo = @"https://www.inoreader.com/reader/api/0/user-info";
static NSString *const GSKAddSubscription = @"https://www.inoreader.com/reader/api/0/subscription/quickadd";
static NSString *const GSKEditSubscription = @"https://www.inoreader.com/reader/api/0/subscription/edit";
static NSString *const GSKUnreadCounters = @"https://www.inoreader.com/reader/api/0/unread-count";
static NSString *const GSKSubscriptionList = @"https://www.inoreader.com/reader/api/0/subscription/list";
static NSString *const GSKFolderTagList = @"https://www.inoreader.com/reader/api/0/tag/list";
static NSString *const GSKStreamContents = @"https://www.inoreader.com/reader/api/0/stream/content";
static NSString *const GSKItemIds = @"https://www.inoreader.com/reader/api/0/stream/items/ids";
static NSString *const GSKRenameTag = @"https://www.inoreader.com/reader/api/0/rename-tag";
static NSString *const GSKDeleteTag = @"https://www.inoreader.com/reader/api/0/disable-tag";
static NSString *const GSKEditTag = @"https://www.inoreader.com/reader/api/0/edit-tag";
static NSString *const GSKMarkAllRead = @"https://www.inoreader.com/reader/api/0/mark-all-as-read";


#endif /* GSKApiConfig_h */
