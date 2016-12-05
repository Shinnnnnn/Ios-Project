//
//  HttpManager.m
//  beautifulWardrobe
//
//  Created by mac on 15-11-4.
//  Copyright (c) 2015年 喂我看上你啦. All rights reserved.
//

#import "HttpManager.h"
#import "ASIHTTPRequest.h"
#import "AlertView_Timer.h"
#import "Reachability.h"


#define API_URL  @"http://221.6.15.170:18060/zhufang_api/api"

@implementation HttpManager

// 保障类型接口
+ (void)requestBZLXWithcompletionBlock:(CompletionBlock)block integer:(NSInteger)integer
{
    NSDictionary *dic=@{@"type":[NSString stringWithFormat:@"%ld",integer]};
    NSDictionary*user=[[NSDictionary alloc] initWithObjectsAndKeys:@"policy",@"cmd", dic,@"params", nil];
    if ([NSJSONSerialization isValidJSONObject:user])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:user options:NSJSONWritingPrettyPrinted error: &error];
        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
//        NSLog(@"Register JSON:%@",[[NSString alloc] initWithData:tempJsonData encoding:NSUTF8StringEncoding]);
        
        // 221.226.102.18:18060/zhufang_api/api
        // 221.6.15.170:18060/zhufang_api/api
        NSURL *url = [NSURL URLWithString:API_URL];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
        [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
        [request addRequestHeader:@"Accept" value:@"application/json"];
        [request setRequestMethod:@"POST"];
        [request setPostBody:tempJsonData];
        [request setTimeOutSeconds:3];
        [request startSynchronous];
        NSError *error1 = [request error];
        if (!error1)
        {
            NSString *response = [request responseString];
            NSData *jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary*responseJsonDic=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"Test：%@",responseJsonDic);
            block(responseJsonDic);
        }
        else
        {
            NSLog(@"%@",error1);
            AlertView_Timer * alert = [[AlertView_Timer alloc] init];
            [alert distributionNotesShow];
        }
    }
}
// 热点问答接口
+ (void)requestRDWDWithcompletionBlock:(CompletionBlock)block  integer:(NSInteger)integer
{
    NSDictionary *dic=@{@"type":[NSString stringWithFormat:@"%ld",integer]};
    NSDictionary*user=[[NSDictionary alloc] initWithObjectsAndKeys:@"question",@"cmd", dic,@"params", nil];
    if ([NSJSONSerialization isValidJSONObject:user])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:user options:NSJSONWritingPrettyPrinted error: &error];
        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
        NSURL *url = [NSURL URLWithString:API_URL];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
        [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
        [request addRequestHeader:@"Accept" value:@"application/json"];
        [request setRequestMethod:@"POST"];
        [request setPostBody:tempJsonData];
        [request setTimeOutSeconds:3];
        [request startSynchronous];
        NSError *error1 = [request error];
        if (!error1)
        {
            NSString *response = [request responseString];
            NSData *jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary*responseJsonDic=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"Test：%@",responseJsonDic);
            block(responseJsonDic);
        }
        else
        {
             NSLog(@"%@",error1);
            AlertView_Timer * alert = [[AlertView_Timer alloc] init];
            [alert distributionNotesShow];
        }
    }
}
// 问题列表接口
+ (void)requestWTLBWithcompletionBlock:(CompletionBlock)block integer:(NSInteger)integer
{
    NSDictionary *dic=@{@"type":[NSString stringWithFormat:@"%ld",integer]};
    NSDictionary*user=[[NSDictionary alloc] initWithObjectsAndKeys:@"testQuestion",@"cmd", dic,@"params", nil];
    if ([NSJSONSerialization isValidJSONObject:user])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:user options:NSJSONWritingPrettyPrinted error: &error];
        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
        //        NSLog(@"Register JSON:%@",[[NSString alloc] initWithData:tempJsonData encoding:NSUTF8StringEncoding]);
        NSURL *url = [NSURL URLWithString:API_URL];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        //        [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
        //        [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
        //        [request addRequestHeader:@"Accept" value:@"application/json"];
        [request setRequestMethod:@"POST"];
        [request setPostBody:tempJsonData];
        [request setTimeOutSeconds:3];
        [request startSynchronous];
        NSError *error1 = [request error];
        if (!error1)
        {
            NSString *response = [request responseString];
            NSData *jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary*responseJsonDic=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
            //            NSLog(@"Test：%@",response);
            NSLog(@"Test：%@",responseJsonDic);
            block(responseJsonDic);
        }
        else
        {
             NSLog(@"%@",error1);
            AlertView_Timer * alert = [[AlertView_Timer alloc] init];
            [alert distributionNotesShow];
        }
    }
}
// 提交评价接口
+ (void)requestTJCPWithcompletionBlock:(CompletionBlock)block integer:(NSInteger)integer listArr:(NSArray*)listArr
{
    NSDictionary *dic=@{@"type":[NSString stringWithFormat:@"%ld",integer],@"list":listArr};
    NSDictionary*user=[[NSDictionary alloc] initWithObjectsAndKeys:@"testResult",@"cmd", dic,@"params", nil];
    if ([NSJSONSerialization isValidJSONObject:user])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:user options:NSJSONWritingPrettyPrinted error: &error];
        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
        //        NSLog(@"Register JSON:%@",[[NSString alloc] initWithData:tempJsonData encoding:NSUTF8StringEncoding]);
        NSURL *url = [NSURL URLWithString:API_URL];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        //        [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
        //        [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
        //        [request addRequestHeader:@"Accept" value:@"application/json"];
        [request setRequestMethod:@"POST"];
        [request setPostBody:tempJsonData];
        [request setTimeOutSeconds:3];
        [request startSynchronous];
        NSError *error1 = [request error];
        if (!error1)
        {
            NSString *response = [request responseString];
            NSData *jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary*responseJsonDic=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
            //            NSLog(@"Test：%@",response);
            NSLog(@"Test：%@",responseJsonDic);
            block(responseJsonDic);
        }
        else
        {
            NSLog(@"%@",error1);
            AlertView_Timer * alert = [[AlertView_Timer alloc] init];
            [alert distributionNotesShow];
        }
    }
}
@end
