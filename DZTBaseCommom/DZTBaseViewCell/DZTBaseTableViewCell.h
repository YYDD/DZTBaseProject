//
//  DZTBaseTableViewCell.h
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/15.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZTBaseTableViewCell : UITableViewCell


+(instancetype)createCellWithTable:(UITableView *)table;

/**
 初始化UI
 */
- (void)initUI;

/**
 底部的分割线 默认 [UIColor lightGrayColor]
 */
@property (nonatomic, weak)CALayer *bottomLineLayer;


/**
 设置分割线颜色
 
 @param color 默认 RGB:(237,239,243,1.0)
 */
+(void)setBottomLineColor:(UIColor *)color;


@end

