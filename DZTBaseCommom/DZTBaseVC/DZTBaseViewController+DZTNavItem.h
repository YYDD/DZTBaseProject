//
//  DZTBaseViewController+DZTNavItem.h
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/11.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "DZTBaseViewController.h"

@interface DZTBaseViewController (DZTNavItem)

- (void)initNavTheme;

- (void)resetNavTheme;

- (void)addLeftTextItem:(NSString *)itemString target:(id)target action:(SEL)selector;

- (void)addRightTextItem:(NSString *)itemString target:(id)target action:(SEL)selector;

- (void)addLeftImageItem:(UIImage *)itemImage target:(id)target action:(SEL)selector;

- (void)addRightImageItem:(UIImage *)itemImage target:(id)target action:(SEL)selector;

- (void)addTitleTextItem:(NSString *)itemString;

- (void)addTitleImageItem:(UIImage *)itemImage;


@end


