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
    [self addLeftTextItem:@"左1" action:@selector(leftBtnClick)];
    [self addRightTextItem:@"右1" action:@selector(rightBtnClick)];

    
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor redColor];
    bgView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:bgView];
    
}

- (void)leftBtnClick {
    
    TestTableViewController *vc = [[TestTableViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)rightBtnClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
