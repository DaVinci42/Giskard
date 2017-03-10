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
#import "LoginModel.h"
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
    NSURLRequest *request = [LoginModel buildLoginRequest];
    [_webView loadRequest:request];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *url = [request URL].absoluteString;
    if ([url localizedStandardContainsString:kRedirectUri]) {
        return NO;
    }
    return YES;
}



@end
