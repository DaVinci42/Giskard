//
//  HomeViewController.m
//  Giskard
//
//  Created by Dan Xin on 2017/3/3.
//  Copyright © 2017年 Dan Xin. All rights reserved.
//

#import "HomeViewController.h"
#import "ArticleTableTableViewController.h"
#import "DVCNetClient.h"

@interface HomeViewController ()

@property (nonatomic, strong) ArticleTableTableViewController *articleTableViewController;

@end


@implementation HomeViewController

-(void) viewDidLoad {
    _articleTableViewController = [[ArticleTableTableViewController alloc] init];
    [self.view addSubview:_articleTableViewController.view];
    
    DVCNetClient *client = [DVCNetClient sharedClient];
    [client performGetRequest:@"https://jsonplaceholder.typicode.com/posts"
          withRespondeHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
              NSLog(@"result: %@", responseObject);
          }];
}

@end
