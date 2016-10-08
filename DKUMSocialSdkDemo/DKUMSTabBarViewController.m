//
//  DKUMSTabBarViewController.m
//  DKUMSocialSdkDemo
//
//  Created by devzkn on 08/10/2016.
//  Copyright © 2016 DevKevin. All rights reserved.
//

#import "DKUMSTabBarViewController.h"
#import "DKUMShareContentViewController.h"
#import "DKUMSLoginTableViewController.h"
#import "DKUMSUserInfoTableViewController.h"


@interface DKUMSTabBarViewController ()

@end

@implementation DKUMSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    DKUMShareContentViewController *shareVc = [[DKUMShareContentViewController alloc] init];
    shareVc.title = @"分享";
    shareVc.tabBarItem.image = [UIImage imageNamed:@"UMS_share"];
    UINavigationController *shareNavi = [[UINavigationController alloc] initWithRootViewController:shareVc];
    
    DKUMSLoginTableViewController *loginVc = [[DKUMSLoginTableViewController alloc] init];
    loginVc.title = @"授权";
    loginVc.tabBarItem.image = [UIImage imageNamed:@"UMS_account"];
    UINavigationController *loginNavi = [[UINavigationController alloc] initWithRootViewController:loginVc];
    
    
    DKUMSUserInfoTableViewController *userInfoVc = [[DKUMSUserInfoTableViewController alloc] init];
    userInfoVc.title = @"用户资料";
    userInfoVc.tabBarItem.image = [UIImage imageNamed:@"UMS_bar"];
    UINavigationController *userInfoNavi = [[UINavigationController alloc] initWithRootViewController:userInfoVc];
    
    //UIRectEdgeNone
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        shareVc.edgesForExtendedLayout = UIRectEdgeNone;
        loginVc.edgesForExtendedLayout = UIRectEdgeNone;
        userInfoVc.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.viewControllers = [NSArray arrayWithObjects:shareNavi, loginNavi, userInfoNavi, nil];
}



@end
