//
//  TestViewController.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/12.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "TestViewController.h"
#import "DZTBaseViewController+DZTNavItem.h"
#import "TestTableViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navThemeName = @"theme1";
    
    self.title = @"测试标题1";
    [self addLeftTextItem:@"左1" action:nil];
    [self addRightTextItem:@"右1" action:@selector(rightBtnClick)];

    
    
}


- (void)rightBtnClick {
    
//    [self.navigationController popViewControllerAnimated:YES];
    TestTableViewController *vc = [[TestTableViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
