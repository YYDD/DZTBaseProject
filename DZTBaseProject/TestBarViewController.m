//
//  TestBarViewController.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/15.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "TestBarViewController.h"
#import "TestViewController.h"
#import "TestTableViewController.h"
#import "TestPageViewController.h"

@interface TestBarViewController ()

@property (nonatomic,assign)NSInteger lastSelectedIndex;

@end

@implementation TestBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lastSelectedIndex = -1;
    self.delegate = self;
    [self initUI];
    
}

-(void)initUI {
    self.tabBar.translucent = NO;
    
    TestViewController *homeVC = [[TestViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    homeVC.hidesBottomBarWhenPushed = NO;
    
    UITabBarItem *homeItem = [[UITabBarItem alloc]init];
    homeItem.image = [[UIImage imageNamed:@"tabPic"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeItem.selectedImage = [[UIImage imageNamed:@"tabPicSt"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeItem.title = @"首页";
    [homeItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateNormal];
    [homeItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
    homeItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    homeVC.tabBarItem = homeItem;

    
    TestTableViewController *workVC = [[TestTableViewController alloc]init];
    UINavigationController *workNav = [[UINavigationController alloc] initWithRootViewController:workVC];
    workVC.hidesBottomBarWhenPushed = NO;
    UITabBarItem *workItem = [[UITabBarItem alloc]init];
    workItem.image = [[UIImage imageNamed:@"tabSearch"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    workItem.selectedImage = [[UIImage imageNamed:@"tabSearchSt"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    workItem.title = @"聊天室";
    [workItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateNormal];
    [workItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
    workItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    workNav.tabBarItem = workItem;
    
    
    TestPageViewController *myVC = [[TestPageViewController alloc]init];
    UINavigationController *myNav = [[UINavigationController alloc] initWithRootViewController:myVC];
    myVC.hidesBottomBarWhenPushed = NO;
    
    UITabBarItem *myItem = [[UITabBarItem alloc]init];
    myItem.image = [[UIImage imageNamed:@"tabProfile"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myItem.selectedImage = [[UIImage imageNamed:@"tabProfileSt"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myItem.title = @"我的";
    [myItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateNormal];
    [myItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
    myItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    myNav.tabBarItem = myItem;
    
    [self addChildViewController:homeNav];
    [self addChildViewController:workNav];
    [self addChildViewController:myNav];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
