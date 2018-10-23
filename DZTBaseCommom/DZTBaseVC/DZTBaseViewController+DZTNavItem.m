//
//  DZTBaseViewController+DZTNavItem.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/11.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "DZTBaseViewController+DZTNavItem.h"
#import "UIImage+Color.h"
#import "DZTThemeConfig.h"
#import <objc/runtime.h>

@implementation DZTBaseViewController (DZTNavItem)

- (void)initNavTheme {

    [self removeConfigInfoCache];
    DZTNavgationConfigInfo *info = [self configInfo];
    
    if (info.bgColor) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFilledWithColor:info.bgColor] forBarMetrics:UIBarMetricsDefault];
    }else {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    }
    self.navigationController.navigationBar.titleTextAttributes = [self titleAttributes];
}

- (void)resetNavTheme {
    [self initNavTheme];
}

- (void)addLeftTextItem:(NSString *)itemString target:(id)target action:(SEL)selector {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:itemString style:UIBarButtonItemStylePlain target:target action:selector];
    [item setTitleTextAttributes:[self itemAttributes] forState:UIControlStateNormal];
    [item setTitleTextAttributes:[self itemAttributes] forState:UIControlStateHighlighted];
    [self.navigationItem setLeftBarButtonItem:item];
    
}

- (void)addRightTextItem:(NSString *)itemString target:(id)target action:(SEL)selector {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:itemString style:UIBarButtonItemStylePlain target:target action:selector];
    [item setTitleTextAttributes:[self itemAttributes] forState:UIControlStateNormal];
    [item setTitleTextAttributes:[self itemAttributes] forState:UIControlStateHighlighted];
    [self.navigationItem setRightBarButtonItem:item];
}

- (void)addLeftImageItem:(UIImage *)itemImage target:(id)target action:(SEL)selector {
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:itemImage style:UIBarButtonItemStylePlain target:target action:selector];
    [item setTitleTextAttributes:[self itemAttributes] forState:UIControlStateNormal];
    [item setTitleTextAttributes:[self itemAttributes] forState:UIControlStateHighlighted];
    [self.navigationItem setLeftBarButtonItem:item];
}

- (void)addRightImageItem:(UIImage *)itemImage target:(id)target action:(SEL)selector {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:itemImage style:UIBarButtonItemStylePlain target:target action:selector];
    [item setTitleTextAttributes:[self itemAttributes] forState:UIControlStateNormal];
    [item setTitleTextAttributes:[self itemAttributes] forState:UIControlStateHighlighted];
    [self.navigationItem setRightBarButtonItem:item];
}

- (void)addTitleTextItem:(NSString *)itemString {
 
    self.navigationItem.title = itemString;
}

- (void)addTitleImageItem:(UIImage *)itemImage {
    
    UIImageView *imgV = [[UIImageView alloc]init];
    imgV.image = itemImage;
    [imgV sizeToFit];
    self.navigationItem.titleView = imgV;
}



- (NSDictionary *)itemAttributes {
    
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];
    DZTNavgationConfigInfo *info = [self configInfo];
    if (info.foregroundItemColor) {
        [mutDict setObject:info.foregroundItemColor forKey:NSForegroundColorAttributeName];
    }
    if (info.itemFont) {
        [mutDict setObject:info.itemFont forKey:NSFontAttributeName];
    }

    return [mutDict copy];
}

- (NSDictionary *)titleAttributes {
    
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];
    DZTNavgationConfigInfo *info = [self configInfo];
    if (info.foregroundTitleColor) {
        [mutDict setObject:info.foregroundTitleColor forKey:NSForegroundColorAttributeName];
    }
    if (info.titleFont) {
        [mutDict setObject:info.titleFont forKey:NSFontAttributeName];
    }
    
    return [mutDict copy];
}

- (DZTNavgationConfigInfo *)configInfo {

    DZTNavgationConfigInfo *info = objc_getAssociatedObject(self, @selector(configInfo));
    if (!info) {
                
        info = [DZTThemeConfig configInfoInNavTheme:self.navThemeName];
        objc_setAssociatedObject(self, @selector(configInfo), info, OBJC_ASSOCIATION_RETAIN);
    }
    return info;
}

- (void)removeConfigInfoCache {
    objc_setAssociatedObject(self, @selector(configInfo), nil, OBJC_ASSOCIATION_RETAIN);
}

@end
