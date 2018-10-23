//
//  TestHeader.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/14.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "TestHeader.h"

@implementation TestHeader

- (void)prepare {
    [super prepare];
    
    [self setTitle:@"~普通闲置状态~" forState:MJRefreshStateIdle];
    [self setTitle:@"~松开就可以进行刷新的状态~" forState:MJRefreshStatePulling];
    [self setTitle:@"~正在刷新中的状态~" forState:MJRefreshStateRefreshing];
    [self setTitle:@"~即将刷新的状态~" forState:MJRefreshStateWillRefresh];
}


@end
