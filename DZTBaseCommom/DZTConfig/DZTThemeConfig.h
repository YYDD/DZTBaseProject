//
//  DZTThemeConfig.h
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/14.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DZTNavgationConfigInfo;
@class DZTRefreshConfigInfo;

@class MJRefreshAutoFooter;
@class MJRefreshStateHeader;

@interface DZTThemeConfig : NSObject

+ (DZTNavgationConfigInfo *)configInfoInNavTheme:(NSString *)navTheme;

/**
 默认加入主题（默认主题名字为default）theme不要和其冲突
 
 @param info 主题
 */
+ (void)addDefaultNavThemeWithConfig:(DZTNavgationConfigInfo *)info;

+ (void)addNavThemeWithConfig:(DZTNavgationConfigInfo *)info WithNavThemeName:(NSString *)navThemeName;


+ (DZTRefreshConfigInfo *)configInfoInRefreshTheme:(NSString *)refreshTheme;

+ (void)addDefaultRefreshThemeWithConfig:(DZTRefreshConfigInfo *)info;

+ (void)addRefreshThemeWithConfig:(DZTRefreshConfigInfo *)info WithRefreshThemeName:(NSString *)refreshThemeName;

@end


@interface DZTNavgationConfigInfo : NSObject
/// nav 背景色
@property (nonatomic, copy) UIColor *bgColor;
/// 前面item 颜色
@property (nonatomic, copy) UIColor *foregroundItemColor;
/// 前面title 颜色 没有的话 使用foregroundItemColor
@property (nonatomic, copy) UIColor *foregroundTitleColor;
/// item如果是字体的大小
@property (nonatomic, copy) UIFont *itemFont;
///字体大小
@property (nonatomic, copy) UIFont *titleFont;

@property (nonatomic, assign) BOOL hideBottomLine;

/**
 UIStatusBarStyle
 */
@property (nonatomic, strong)NSNumber *statusBarStyleValue;

@end

@interface DZTRefreshConfigInfo : NSObject


@property (nonatomic, copy)NSString *footerClassName;

@property (nonatomic, copy)NSString *headerClassName;

@end

