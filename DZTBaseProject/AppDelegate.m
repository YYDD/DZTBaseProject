//
//  AppDelegate.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/11.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "AppDelegate.h"
#import "DZTThemeConfig.h"
#import "ViewController.h"
#import "TestFooter.h"
#import "TestHeader.h"
#import "TestBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [AppDelegate initNavConfigInfo];
    [AppDelegate initRefreshConfigInfo];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];

    TestBarViewController *tabbar = [[TestBarViewController alloc]init];
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}


+ (void)initNavConfigInfo {
    
    DZTNavgationConfigInfo *whiteInfo = [[DZTNavgationConfigInfo alloc] init];
    whiteInfo.bgColor = [UIColor lightGrayColor];
    whiteInfo.foregroundItemColor = [UIColor redColor];
    whiteInfo.foregroundTitleColor = [UIColor greenColor];
    whiteInfo.titleFont = [UIFont systemFontOfSize:17];
    whiteInfo.itemFont = [UIFont systemFontOfSize:13];
    [DZTThemeConfig addDefaultNavThemeWithConfig:whiteInfo];
    whiteInfo.hideBottomLine = YES;
    whiteInfo.statusBarStyleValue = @(UIStatusBarStyleDefault);
    
    DZTNavgationConfigInfo *whiteInfo1 = [[DZTNavgationConfigInfo alloc] init];
    whiteInfo1.bgColor = [UIColor clearColor];
    whiteInfo1.foregroundItemColor = [UIColor greenColor];
    whiteInfo1.foregroundTitleColor = [UIColor whiteColor];
    whiteInfo1.titleFont = [UIFont systemFontOfSize:13];
    whiteInfo1.itemFont = [UIFont systemFontOfSize:15];
    [DZTThemeConfig addNavThemeWithConfig:whiteInfo1 WithNavThemeName:@"theme1"];
    whiteInfo.hideBottomLine = YES;
    whiteInfo.statusBarStyleValue = @(UIStatusBarStyleLightContent);

    [DZTBaseViewController addDefaultBackgroundColor:[UIColor darkGrayColor]];
    
}


+ (void)initRefreshConfigInfo {
    
    DZTRefreshConfigInfo *info = [[DZTRefreshConfigInfo alloc]init];
    info.headerClassName = NSStringFromClass([TestHeader class]);
    info.footerClassName = NSStringFromClass([TestFooter class]);
    [DZTThemeConfig addDefaultRefreshThemeWithConfig:info];
    
    
}


@end
