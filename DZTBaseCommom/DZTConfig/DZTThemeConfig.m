//
//  DZTThemeConfig.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/14.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "DZTThemeConfig.h"
#import <MJRefresh/MJRefresh.h>

static NSString *defaultNavThemeName = @"defaultNav";
static NSString *defaultRefreshThemeName = @"defaultRefresh";

@interface DZTThemeConfig()

@property (nonatomic, strong)NSMutableDictionary *navThemeDict;
@property (nonatomic, strong)NSMutableDictionary *refreshThemeDict;
@property (nonatomic, strong)DZTRefreshConfigInfo *systemRefreshConfigInfo;

@end

@implementation DZTThemeConfig

+ (instancetype)sharedConfig {
    static DZTThemeConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[DZTThemeConfig alloc]init];
        config.navThemeDict = [[NSMutableDictionary alloc]init];
        config.refreshThemeDict = [[NSMutableDictionary alloc]init];
    });
    return config;
}

+ (DZTNavgationConfigInfo *)configInfoInNavTheme:(NSString *)navTheme {
    if (navTheme.length == 0) {
        navTheme = defaultNavThemeName;
    }
    return [[DZTThemeConfig sharedConfig].navThemeDict objectForKey:navTheme];
}

+ (void)addDefaultNavThemeWithConfig:(DZTNavgationConfigInfo *)info {
    [DZTThemeConfig addNavThemeWithConfig:info WithNavThemeName:defaultNavThemeName];
}

+ (void)addNavThemeWithConfig:(DZTNavgationConfigInfo *)info WithNavThemeName:(NSString *)navThemeName {
    
    NSAssert(navThemeName.length != 0, @"***navThemeName could not be nil***");
    
    [[DZTThemeConfig sharedConfig].navThemeDict setObject:info forKey:navThemeName];
}



+ (DZTRefreshConfigInfo *)configInfoInRefreshTheme:(NSString *)refreshTheme {
    if (refreshTheme.length == 0) {
        refreshTheme = defaultRefreshThemeName;
    }
    
    DZTRefreshConfigInfo *info = [[DZTThemeConfig sharedConfig].refreshThemeDict objectForKey:refreshTheme];
    if (!info) {
        info = [DZTThemeConfig sharedConfig].systemRefreshConfigInfo;
        [DZTThemeConfig addDefaultRefreshThemeWithConfig:info];
    }
    return info;
}

+ (void)addDefaultRefreshThemeWithConfig:(DZTRefreshConfigInfo *)info {
    
    [DZTThemeConfig addRefreshThemeWithConfig:info WithRefreshThemeName:defaultRefreshThemeName];
}

+ (void)addRefreshThemeWithConfig:(DZTRefreshConfigInfo *)info WithRefreshThemeName:(NSString *)refreshThemeName {
    
    NSAssert(refreshThemeName.length != 0, @"***refreshThemeName could not be nil***");
    NSAssert(info.headerClassName.length != 0, @"***headerClassName could not be nil***");
    NSAssert(info.footerClassName.length != 0, @"***footerClassName could not be nil***");
    
    [[DZTThemeConfig sharedConfig].refreshThemeDict setObject:info forKey:refreshThemeName];
}

- (DZTRefreshConfigInfo *)systemRefreshConfigInfo {
    if (!_systemRefreshConfigInfo) {
        _systemRefreshConfigInfo = [DZTRefreshConfigInfo new];
        
        _systemRefreshConfigInfo.headerClassName = NSStringFromClass([MJRefreshStateHeader class]);
        _systemRefreshConfigInfo.footerClassName = NSStringFromClass([MJRefreshAutoFooter class]) ;
    }
    return _systemRefreshConfigInfo;
}


@end

@implementation DZTNavgationConfigInfo

@end

@implementation DZTRefreshConfigInfo



@end
