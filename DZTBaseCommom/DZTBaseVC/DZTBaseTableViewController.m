//
//  DZTBaseTableViewController.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/12.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "DZTBaseTableViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "DZTThemeConfig.h"

@interface DZTBaseTableViewController ()


@end

@implementation DZTBaseTableViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tableStyle = UITableViewStyleGrouped;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTable];
    [self initRefreshControl];
    [self.tableView.mj_header setHidden:!_showMJHeader];
    [self.tableView.mj_footer setHidden:!_showMJFooter];
}

- (void)initTable {
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:self.tableStyle];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    
    [self.view addSubview:tableView];
 
    if (@available(iOS 11.0, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    

    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;

    tableView.autoresizesSubviews = YES;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    
    _tableView = tableView;
}

- (void)initRefreshControl {
    
   DZTRefreshConfigInfo *configInfo = [DZTThemeConfig configInfoInRefreshTheme:self.refreshThemeName];

    Class headerCls = NSClassFromString(configInfo.headerClassName);
    Class footerCls = NSClassFromString(configInfo.footerClassName);

    __weak typeof(self) weakSelf = self;
    MJRefreshFooter *footer = [footerCls footerWithRefreshingBlock:^{
        [weakSelf loadMoreTable];
    }];
    
    MJRefreshHeader *header = [headerCls headerWithRefreshingBlock:^{
        [weakSelf refreshNewTable];
    }];
    
    self.tableView.mj_header = header;
    self.tableView.mj_footer = footer;
}


#pragma mark - table delegate & dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const identifier = @"basetablecell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    UIImageView *imgV = (UIImageView *)[cell viewWithTag:2];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:16];
        [label setTag:1];
        [cell addSubview:label];
        
        imgV = [[UIImageView alloc]init];
        imgV.backgroundColor = [UIColor lightGrayColor];
        [imgV setTag:2];
        [cell addSubview:imgV];
        
        imgV.frame = CGRectMake(0, 44 - 0.5, [UIScreen mainScreen].bounds.size.width, 0.5);
        
    }
    [label setText:[NSString stringWithFormat:@"%ld如果你看到了这行文字，说明你没有实现table的代理~~",(long)indexPath.row]];
    [label sizeToFit];
    CGRect rect = label.frame;
    rect.origin.x = 5;
    rect.size.height = 44;
    label.frame = rect;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - DZTScrollRefreshControlProtocol
- (void)refreshNewTable {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self endRefreshInHeader];
    });
}

- (void)loadMoreTable {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self endRefreshInFooter];
    });
}

- (void)endRefreshInHeader {
    if (self.showMJFooter) {
        [self resetFooterState];
    }
    [self.tableView.mj_header endRefreshing];
}

- (void)endRefreshInFooter {
    [self.tableView.mj_footer endRefreshing];
}


- (void)noMoreFooterData {
    if (self.showMJFooter) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView.mj_footer setHidden:NO];
            self.tableView.mj_footer.state = MJRefreshStateNoMoreData;
        });
    }
}

- (void)noneData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer setHidden:YES];
    });
}

- (void)resetFooterState {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer setHidden:NO];
        self.tableView.mj_footer.state = MJRefreshStateIdle;
    });
}

- (void)resetFooterState2 {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.tableView.mj_footer.state = MJRefreshStateIdle;
    });
}

- (void)beginRefreshing {
    if (self.showMJFooter) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView.mj_footer setHidden:YES];
        });
    }
    [self.tableView.mj_header beginRefreshing];
}


- (void)setShowMJHeader:(BOOL)showMJHeader {
    _showMJHeader = showMJHeader;
    [self.tableView.mj_header setHidden:!showMJHeader];
}

- (void)setShowMJFooter:(BOOL)showMJFooter {
    _showMJFooter = showMJFooter;
    [self.tableView.mj_footer setHidden:!showMJFooter];
}

#pragma mark - Setters & Getters

- (void)setTableStyle:(UITableViewStyle)tableStyle {

    _tableStyle = tableStyle;

    if (self.tableView) {
        [self initTable];
    }
}


@end
