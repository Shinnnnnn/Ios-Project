//
//  AlertView_Timer.m
//  SecurityRoom
//
//  Created by zte_gdy on 16/4/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "AlertView_Timer.h"


@implementation AlertView_Timer

- (void)distributionNotesShow
{
    UIWindow*window=[[UIApplication sharedApplication] keyWindow];
    UIView*topView=[window.subviews firstObject];
    [topView addSubview:self];
    self.frame=[UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    [UIView animateWithDuration:0.5 animations:^{
        self.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        //        _notesView.frame= CGRectMake(15, SCREEN_HEIGHT/2-80, SCREEN_WIDTH-30, 200);
        _alertView.alpha=1;
    }];
}
- (void)bgView
{
    UIView*bgView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, SCREEN_WIDTH)];
    self.backgroundColor=[UIColor blackColor];
    [self addSubview:bgView];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _alertView=[[UIView alloc] initWithFrame:CGRectMake(80.0/750*SCREEN_WIDTH, 565.0/1334*SCREEN_HEIGHT, SCREEN_WIDTH-80.0/750*SCREEN_WIDTH*2, 120.0/1334*SCREEN_HEIGHT)];
        _alertView.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:1.0];
        _alertView.layer.cornerRadius = 10.0/750*SCREEN_WIDTH;//设置弹出框为圆角视图
        _alertView.layer.masksToBounds = YES;
        [self addSubview:_alertView];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0,0, _alertView.frame.size.width, _alertView.frame.size.height)];
        label.text = @"请检查你的网络设置...";
        label.numberOfLines=0;
        label.textColor=[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        label.font=[UIFont systemFontOfSize:30/2];
        label.textAlignment = NSTextAlignmentCenter;
        [_alertView addSubview:label];
        _myTimer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(jishiTimer) userInfo:nil repeats:YES];
        _jishiTime=1;
    }
    return self;
}
#pragma mark- 定时器计时方法
- (void)jishiTimer
{
    _jishiTime--;
    if (_jishiTime==0)
    {
        [self removeFromSuperview];
        [_myTimer invalidate];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
