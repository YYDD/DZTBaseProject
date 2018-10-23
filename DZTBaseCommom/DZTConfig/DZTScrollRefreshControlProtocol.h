//
//  DZTScrollRefreshControlProtocol.h
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/14.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#ifndef DZTScrollRefreshControlProtocol_h
#define DZTScrollRefreshControlProtocol_h

@protocol DZTScrollRefreshControlProtocol <NSObject>

@optional

/**
 下拉刷新的回调方法
 */
- (void)refreshNewTable;

/**
 上拉加载更多的回调方法
 */
- (void)loadMoreTable;


/**
 结束上拉加载的动画
 */
- (void)endRefreshInFooter;


/**
 结束下拉刷新的动画
 */
- (void)endRefreshInHeader;


/**
 底部显示没有更多数据，无法再触发上拉加载动作(没有更多数据)
 */
- (void)noMoreFooterData;

/**
 一条数据都没有
 */
- (void)noneData;


/**
 重置底部状态，一般下拉刷新后重置，可以再次进行上拉加载
 */
- (void)resetFooterState;


/**
 重置底部状态，一般下拉刷新后重置，可以再次进行上拉加载
 不设置hidden为NO
 */
- (void)resetFooterState2;

/**
 触动刷新
 */
- (void)beginRefreshing;

@end


#endif /* DZTScrollRefreshControlProtocol_h */
