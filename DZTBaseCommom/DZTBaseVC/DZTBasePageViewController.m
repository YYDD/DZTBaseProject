//
//  DZTBasePageViewController.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/15.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "DZTBasePageViewController.h"

@interface DZTBasePageViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController *pageViewController;

@end

@implementation DZTBasePageViewController

- (void)dealloc {
    self.scrollView.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.pageViewController.view.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:self.pageViewController.view];
    [self addChildViewController:self.pageViewController];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    [self.scrollView.panGestureRecognizer requireGestureRecognizerToFail:self.navigationController.interactivePopGestureRecognizer];
    
    self.pageViewController.view.autoresizesSubviews = YES;
    self.pageViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;

}

#pragma mark - UIPageViewControllerDataSource

- (NSInteger)indexOfController:(UIViewController*)viewController {
    for (NSInteger index = 0; index < [self.viewControllers count]; index++) {
        if (viewController == self.viewControllers[index]) {
            return index;
        }
    }
    return NSNotFound;
}

- (UIViewController *)viewControllerForIndex:(NSInteger)index {
    if (index < 0) {
        return nil;
    }
    if (index >= self.viewControllers.count) {
        return nil;
    }
    return self.viewControllers[index];
}

- (UIViewController*)pageViewController:(UIPageViewController*)pageViewController viewControllerBeforeViewController:(UIViewController*)viewController {
    NSInteger index = [self indexOfController:viewController];
    index--;
    return [self viewControllerForIndex:index];
}

- (UIViewController*)pageViewController:(UIPageViewController*)pageViewController viewControllerAfterViewController:(UIViewController*)viewController {
    NSInteger index = [self indexOfController:viewController];
    index++;
    return [self viewControllerForIndex:index];
}

#pragma mark - UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController*)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray*)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed) {
        NSUInteger index = [self indexOfController:[pageViewController.viewControllers lastObject]];
        [self currentPageChanged:index];
    }
}

#pragma mark - Setters & Getters

- (void)currentPageChanged:(NSInteger)currentPage {
    
}

- (UIViewController *)page_currentViewController {
    if (self.currentPage < self.viewControllers.count) {
        return self.viewControllers[self.currentPage];
    }
    return nil;
}

- (UIPageViewController *)pageViewController {
    if (!_pageViewController) {
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    }
    return _pageViewController;
}

- (UIScrollView *)scrollView {
    for (UIView *view in self.pageViewController.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            return (UIScrollView *)view;
        }
    }
    return nil;
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
    if (viewControllers.count == 0) {
        viewControllers = @[[UIViewController new]];
    }
    
    NSInteger currentPage = [self currentPage];
    
    _viewControllers = [viewControllers copy];
    [self setCurrentPage:currentPage];
}

- (void)setCurrentPage:(NSUInteger)currentPage {
    [self setCurrentPage:currentPage animated:NO completion:NULL];
}

- (NSUInteger)currentPage {
    return [self indexOfController:self.pageViewController.viewControllers.lastObject];
}

- (void)setCurrentPage:(NSUInteger)currentPage animated:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    if (currentPage >= self.viewControllers.count) {
        currentPage = self.viewControllers.count - 1;
    }
    
    NSInteger lastPage = [self currentPage];
    UIPageViewControllerNavigationDirection direction = lastPage > currentPage ? UIPageViewControllerNavigationDirectionReverse : UIPageViewControllerNavigationDirectionForward;
    
    UIViewController *vc = [self viewControllerForIndex:currentPage];
    [self.pageViewController setViewControllers:@[vc?:[UIViewController new]] direction:direction animated:animated completion:completion];
}




@end
