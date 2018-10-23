//
//  DZTBasePageViewController.h
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/15.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "DZTBaseViewController.h"


@interface DZTBasePageViewController : DZTBaseViewController

@property (nonatomic, strong, readonly) UIPageViewController *pageViewController;

@property (nonatomic, strong, readonly) UIScrollView *scrollView;

@property (nonatomic, copy) NSArray<UIViewController *> *viewControllers;

@property (nonatomic, assign) NSUInteger currentPage;

- (void)setCurrentPage:(NSUInteger)currentPage animated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

- (void)currentPageChanged:(NSInteger)currentPage;

- (UIViewController *)page_currentViewController;


@end
