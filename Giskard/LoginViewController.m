//
//  LoginViewController.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/10.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "LoginViewController.h"
#import <UIKit/UIWebView.h>
#import <UIKit/UIScreen.h>
#import "GSKNetClient.h"

@interface LoginViewController ()<UIWebViewDelegate>

@property(nonatomic, strong) UIWebView *webView;

@end

@implementation LoginViewController

+(GSKTokenStatus)isTokenValid {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *accessToken = [userDefault objectForKey:GSKUserDefaultAccessToken];
    NSString *refreshToken = [userDefault objectForKey:GSKUserDefaultRefreshToken];
    NSDate *expiredDate = [userDefault objectForKey:GSKUserDefaultExpiresDate];
    
    if (!accessToken || !refreshToken
        || [accessToken length] == 0 || [refreshToken length] == 0) {
        return GSKTokenEmpty;
    } else if ([expiredDate compare:[NSDate date]] == NSOrderedAscending) {
        return GSKTokenExpired;
    }
    return GSKTokenValid;
}

-(void)loadView {
    [super loadView];
    _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _webView.delegate = self;
    [self.view addSubview:_webView];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [GSKNetClient buildLoginRequest];
    [_webView loadRequest:request];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    // https://yourredirecturi.com/
    //  ?code=[AUTHORIZATION_CODE]
    //  &state=[CSRF_PROTECTION_STRING]
    NSString *code = nil;
    NSString *state =nil;
    NSURLComponents *components = [NSURLComponents componentsWithURL:request.URL
                                             resolvingAgainstBaseURL:NO];
    for (NSURLQueryItem *item in components.queryItems) {
        if ([item.name compare:@"code" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            code = item.value;
        }
        if ([item.name compare:@"state" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            state = item.value;
        }
    }
    if ([state compare:GSKCsrfProtectionString options:NSCaseInsensitiveSearch] == NSOrderedSame && code) {
        [GSKNetClient obtainAccessAndRefreshToken:code
                              respondeHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                                  if (error) {
                                      NSLog(@"error: %@", error);
                                  } else if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                      NSLog(@"response: %@", responseObject);
                                      NSString *accessToken = responseObject[@"access_token"];
                                      NSString *refreshToken = responseObject[@"refresh_token"];
                                      double expiresInSec = [responseObject[@"expires_in"] doubleValue];
                                      NSDate *expiresDate = [[NSDate alloc] initWithTimeInterval:expiresInSec
                                                                                       sinceDate:[NSDate date]];
                                      
                                      NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
                                      [userDefault setObject:accessToken forKey:GSKUserDefaultAccessToken];
                                      [userDefault setObject:refreshToken forKey:GSKUserDefaultRefreshToken];
                                      [userDefault setObject:expiresDate forKey:GSKUserDefaultExpiresDate];
                                      [userDefault synchronize];
                                  }
                              }];
        return NO;
    }
    return YES;
}

@end
