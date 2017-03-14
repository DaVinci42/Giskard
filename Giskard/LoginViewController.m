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
#import "ApiConfig.h"

@interface LoginViewController ()<UIWebViewDelegate>

@property(nonatomic, strong) UIWebView *webView;

@end

@implementation LoginViewController

+(BOOL)isTokenValid {
    return NO;
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
                                  } else {
                                      NSLog(@"response: %@", responseObject);
                                      NSString *accessToken = responseObject[@"access_token"];
                                      NSString *refreshToken = responseObject[@"refresh_token"];
                                      
                                      // TODO token saving
                                  }
                              }];
        return NO;
    }
    return YES;
}

@end
