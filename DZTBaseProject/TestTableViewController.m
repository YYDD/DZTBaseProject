//
//  TestTableViewController.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/12.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "TestTableViewController.h"
#import "DZTBaseViewController+DZTNavItem.h"
#import "TestTableViewController.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"测试列表";
    
    [self addLeftTextItem:@"下一级" action:@selector(backClick)];
    self.showMJHeader = YES;
    
    [self beginRefreshing];
    
}

- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
