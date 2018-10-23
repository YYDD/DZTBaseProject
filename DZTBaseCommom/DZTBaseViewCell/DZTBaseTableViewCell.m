//
//  DZTBaseTableViewCell.m
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/15.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import "DZTBaseTableViewCell.h"

static UIColor *lineColor = nil;

@implementation DZTBaseTableViewCell

+ (void)setBottomLineColor:(UIColor *)color {
    
    if (color) {
        lineColor = color;
    }
}

+(instancetype)createCellWithTable:(UITableView *)table {
    
    NSString *className = NSStringFromClass([self class]);
    DZTBaseTableViewCell *cell = [table dequeueReusableCellWithIdentifier:className];
    if (!cell) {
        cell = [[[self class] alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:className];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CALayer *bottomLineLayer = [[CALayer alloc]init];
        
        if (!lineColor) {
            bottomLineLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        }else {
            bottomLineLayer.backgroundColor = lineColor.CGColor;
        }
        [self.layer addSublayer:_bottomLineLayer = bottomLineLayer];
        
        [self initUI];
        
    }
    return self;
}

- (void)initUI {
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.bottomLineLayer.frame = CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5);
}


@end
