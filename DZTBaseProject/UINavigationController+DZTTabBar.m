//
//  UINavigationController+DZTTabBar.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/17.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "UINavigationController+DZTTabBar.h"
#import <objc/runtime.h>
#import <CFYNavigationBarTransition.h>

@implementation UINavigationController (DZTTabBar)

+(void)load {
    
    SEL originalPushSEL = @selector(pushViewController:animated:);
    SEL swizzlePushSEL = @selector(swizzle_pushViewController:animated:);
    Method originPushMethod = class_getInstanceMethod([self class], originalPushSEL);
    Method swizzlePushMethod = class_getInstanceMethod([self class], swizzlePushSEL);
    
    method_exchangeImplementations(originPushMethod, swizzlePushMethod);
    
    
    SEL originalSEL = @selector(viewDidLoad);
    SEL swizzleSEL = @selector(swizzle_viewDidLoad);
    Method originalMethod = class_getInstanceMethod([UINavigationController class], originalSEL);
    Method swizzleMethod = class_getInstanceMethod([UINavigationController class], swizzleSEL);
    method_exchangeImplementations(originalMethod, swizzleMethod);
    
}


- (void)swizzle_viewDidLoad {
    
    if ([self class] == [UINavigationController class]) {
        [self openCFYNavigationBarFunction:YES];
        [self swizzle_viewDidLoad];
    }
}


-(void)swizzle_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES; //viewController是将要被push的控制器
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];

    [self swizzle_pushViewController:viewController animated:animated];
}

@end
