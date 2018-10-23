//
//  DZTBaseViewModel.h
//  DZTBaseProject
//
//  Created by YYDD on 2018/10/15.
//  Copyright © 2018年 com.yydd.dzt. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  completion1
 *
 *  @param success 结果
 *  @param msg     信息文案
 *  @param data    数据
 */
typedef void (^BaseCompletion1)(BOOL success , NSString *msg, id data);

/**
 *  completion2
 *
 *  @param success 结果
 *  @param msg     信息文案
 */
typedef void (^BaseCompletion2)(BOOL success , NSString *msg);


/**
 completion3
 
 @param success    结果
 @param msg        信息文案
 @param data       数据
 @param noMoreData 不再有更多数据（用于分页时候）
 */
typedef void (^BaseCompletion3)(BOOL success , NSString *msg, id data, BOOL noMoreData);

/**
 completion4
 
 @param success    结果
 @param msg        信息文案
 @param noMoreData 不再有更多数据（用于分页时候）
 */
typedef void (^BaseCompletion4)(BOOL success , NSString *msg, BOOL noMoreData);



@interface DZTBaseViewModel : NSObject

@end

