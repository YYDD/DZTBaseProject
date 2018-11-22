//
//  DZTBaseViewController.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/11.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "DZTBaseViewController.h"
#import "DZTBaseViewController+DZTNavItem.h"
#import <UIViewController+YPNavigationBarTransition.h>

///默认背景颜色
static UIColor *defaultBgColor = nil;

@interface DZTBaseViewController ()

@end

@implementation DZTBaseViewController


+ (void)addDefaultBackgroundColor:(UIColor *)color {

    defaultBgColor = color;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //ext
    [self initNavTheme];
    
    if (defaultBgColor) {
        self.view.backgroundColor = defaultBgColor;
    }
}


- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    [self resetNavTheme];
}

- (void)setNavThemeName:(NSString *)navThemeName {
    _navThemeName = navThemeName;
    [self resetNavTheme];//ext
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    [self addTitleTextItem:title];
}

- (void)setInTab:(BOOL)inTab {
    _inTab = inTab;
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}



@end
