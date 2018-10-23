//
//  DZTBaseViewController.h
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/11.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DZTNavgationConfig;
@interface DZTBaseViewController : UIViewController

/**
 是否在tabbar的首页 default is NO
 */
@property (nonatomic, assign) BOOL inTab;

/**
 主题名称
 */
@property (nonatomic, strong)NSString *navThemeName;

@property (nonatomic, strong)NSString *refreshThemeName;




/**
 添加默认颜色

 @param color 默认颜色
 */
+ (void)addDefaultBackgroundColor:(UIColor *)color;

@end


