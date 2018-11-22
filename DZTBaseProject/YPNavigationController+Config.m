//
//  YPNavigationController+Config.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/11/22.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "YPNavigationController+Config.h"

@implementation YPNavigationController (Config)

- (YPNavigationBarConfigurations) yp_navigtionBarConfiguration {
//    return YPNavigationBarStyleBlack | YPNavigationBarBackgroundStyleTranslucent | YPNavigationBarBackgroundStyleNone;
    return YPNavigationBarBackgroundStyleOpaque;
}

- (UIColor *) yp_navigationBarTintColor {
    return [UIColor whiteColor];
}

@end
