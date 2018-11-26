//
//  DZTBaseCollectionViewController.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/15.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "DZTBaseCollectionViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "DZTThemeConfig.h"

@interface DZTBaseCollectionViewController ()

@end

@implementation DZTBaseCollectionViewController

- (void)dealloc {
    self.collectionView.delegate = nil;
    self.collectionView.dataSource = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initCollection];
    [self initRefreshControl];
    [self.collectionView.mj_header setHidden:!_showMJHeader];
    [self.collectionView.mj_footer setHidden:!_showMJFooter];

}

- (void)setFlowLayout:(UICollectionViewFlowLayout *)flowLayout {
    _flowLayout = flowLayout;
    self.collectionView.collectionViewLayout = flowLayout;
}

- (void)initCollection {
    
    UICollectionViewFlowLayout *layout = nil;
    if (self.flowLayout) {
        layout = self.flowLayout;
    }else {
        layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing= 10;
        layout.minimumInteritemSpacing= 10;
    }
 
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.navigationController.navigationBar.frame), [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(self.navigationController.navigationBar.frame)) collectionViewLayout:layout];
    
    collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView = collectionView];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    if (@available(iOS 11.0, *)) {
        collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    collectionView.autoresizesSubviews = YES;
    collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"baseCollectionCell"];
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
    
    self.collectionView.mj_header = header;
    self.collectionView.mj_footer = footer;
}
#pragma mark - collection delegate & dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(50, 50);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"baseCollectionCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"baseCollectionCell" forIndexPath:indexPath];
    }
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
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
    [self.collectionView.mj_header endRefreshing];
}

- (void)endRefreshInFooter {
    [self.collectionView.mj_footer endRefreshing];
}


- (void)noMoreFooterData {
    if (self.showMJFooter) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView.mj_footer setHidden:NO];
            self.collectionView.mj_footer.state = MJRefreshStateNoMoreData;
        });
    }
}

- (void)noneData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView.mj_footer setHidden:YES];
    });
}

- (void)resetFooterState {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView.mj_footer setHidden:NO];
        self.collectionView.mj_footer.state = MJRefreshStateIdle;
    });
}

- (void)resetFooterState2 {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.collectionView.mj_footer.state = MJRefreshStateIdle;
    });
}

- (void)beginRefreshing {
    if (self.showMJFooter) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView.mj_footer setHidden:YES];
        });
    }
    [self.collectionView.mj_header beginRefreshing];
}


- (void)setShowMJHeader:(BOOL)showMJHeader {
    _showMJHeader = showMJHeader;
    [self.collectionView.mj_header setHidden:!showMJHeader];
}

- (void)setShowMJFooter:(BOOL)showMJFooter {
    _showMJFooter = showMJFooter;
    [self.collectionView.mj_footer setHidden:!showMJFooter];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
