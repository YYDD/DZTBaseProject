//
//  ViewController.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/11.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "ViewController.h"
#import "DZTBaseViewController+DZTNavItem.h"
#import "TestViewController.h"
#import "TestTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试";
    [self addLeftTextItem:@"去列表" target:self action:@selector(leftBtnClick)];
    [self addRightTextItem:@"去普通" target:self action:@selector(rightBtnClick)];
}

- (void)rightBtnClick {
    
    TestViewController *vc = [[TestViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)leftBtnClick {
    
    TestTableViewController *vc = [[TestTableViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
