//
//  TestPageViewController.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/15.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "TestPageViewController.h"

#import "TestViewController.h"
#import "TestTableViewController.h"

@interface TestPageViewController ()

@end

@implementation TestPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TestTableViewController *tVC = [[TestTableViewController alloc]init];
    tVC.view.backgroundColor = [UIColor redColor];
    
    TestViewController *VC = [[TestViewController alloc]init];
    VC.view.backgroundColor = [UIColor blueColor];
    
    self.viewControllers = @[tVC,VC];
}



@end
