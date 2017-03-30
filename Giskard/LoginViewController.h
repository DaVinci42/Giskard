//
//  LoginViewController.h
//  Giskard
//
//  Created by Dan Xin on 2017/3/10.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>
#import "GSKApiConfig.h"

@interface LoginViewController : UIViewController

+ (GSKTokenStatus)isTokenValid;

@end
