//
//  DZTBaseTableViewController.h
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/12.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "DZTBaseViewController.h"
#import "DZTScrollRefreshControlProtocol.h"

@interface DZTBaseTableViewController : DZTBaseViewController<UITableViewDelegate,UITableViewDataSource,DZTScrollRefreshControlProtocol>

@property (nonatomic, weak)UITableView *tableView;

@property (nonatomic, assign) UITableViewStyle tableStyle;

/**
 *  是否显示加载下拉刷新的控件 defalut is NO
 */
@property (nonatomic, assign) BOOL showMJHeader;

/**
 *  是否显示上拉加载更多的控件 defalut is NO
 */
@property (nonatomic, assign) BOOL showMJFooter;

@end

