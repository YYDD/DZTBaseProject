//
//  DZTBaseCollectionViewController.h
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/15.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "DZTBaseViewController.h"
#import "DZTScrollRefreshControlProtocol.h"

@interface DZTBaseCollectionViewController : DZTBaseViewController<UICollectionViewDelegate,UICollectionViewDataSource,DZTScrollRefreshControlProtocol>


@property (nonatomic, weak) UICollectionView *collectionView;

/**
 *  是否显示加载下拉刷新的控件 defalut is NO
 */
@property (nonatomic, assign) BOOL showMJHeader;

/**
 *  是否显示上拉加载更多的控件 defalut is NO
 */
@property (nonatomic, assign) BOOL showMJFooter;



/**
 *  修改flowLayout
 */
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;


/**
 *  完全使用自定义的collection
 */
- (void)initCollection;



@end

