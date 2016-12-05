//
//  HttpManager.h
//  beautifulWardrobe
//
//  Created by mac on 15-11-4.
//  Copyright (c) 2015年 喂我看上你啦. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义，声明这个block类型
typedef void  (^CompletionBlock)(NSDictionary *dic);
@interface HttpManager : NSObject

// 保障类型接口
+ (void)requestBZLXWithcompletionBlock:(CompletionBlock)block integer:(NSInteger)integer;
// 热点问答接口
+ (void)requestRDWDWithcompletionBlock:(CompletionBlock)block integer:(NSInteger)integer;
// 问题列表接口
+ (void)requestWTLBWithcompletionBlock:(CompletionBlock)block integer:(NSInteger)integer;
// 提交评价接口
+ (void)requestTJCPWithcompletionBlock:(CompletionBlock)block integer:(NSInteger)integer listArr:(NSArray*)listArr;

@end
