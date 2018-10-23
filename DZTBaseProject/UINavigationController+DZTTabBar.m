//
//  UINavigationController+DZTTabBar.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/17.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "UINavigationController+DZTTabBar.h"
#import <objc/runtime.h>

@implementation UINavigationController (DZTTabBar)

+(void)load {
    
    SEL originalPushSEL = @selector(pushViewController:animated:);
    SEL swizzlePushSEL = @selector(swizzle_pushViewController:animated:);
    Method originPushMethod = class_getInstanceMethod([self class], originalPushSEL);
    Method swizzlePushMethod = class_getInstanceMethod([self class], swizzlePushSEL);
    
    method_exchangeImplementations(originPushMethod, swizzlePushMethod);
    
}


-(void)swizzle_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES; //viewController是将要被push的控制器
    [self swizzle_pushViewController:viewController animated:animated];
}

@end
