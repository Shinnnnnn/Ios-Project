//
//  AlertView.m
//  自定义弹窗demo
//
//  Created by 朱昊 on 16/3/25.
//  Copyright © 2016年 zhuhao. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView

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
        _alertView=[[UIView alloc] initWithFrame:CGRectMake(60.0/750*SCREEN_WIDTH, 565.0/1334*SCREEN_HEIGHT, SCREEN_WIDTH-60.0/750*SCREEN_WIDTH*2, 250.0/1334*SCREEN_HEIGHT)];
        _alertView.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:1.0];
        _alertView.layer.cornerRadius = 5.0/750*SCREEN_WIDTH;//设置弹出框为圆角视图
        _alertView.layer.masksToBounds = YES;
        [self addSubview:_alertView];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(40.0/750*SCREEN_WIDTH, 0, _alertView.frame.size.width-40.0/750*SCREEN_WIDTH*2, 80)];
        label.text = @"本测评仅供参考，最新标准以实际申请时为准。";
        label.numberOfLines=0;
        label.textColor=[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        label.font=[UIFont systemFontOfSize:32/2];
        label.textAlignment = NSTextAlignmentCenter;
        [_alertView addSubview:label];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(40.0/750*SCREEN_WIDTH,label.frame.size.height, _alertView.frame.size.width-40.0/750*SCREEN_WIDTH*2, _alertView.frame.size.height-label.frame.size.height)];
        [button setTitle:@"知道了" forState:UIControlStateNormal];
        button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
        [button setTitleColor:[UIColor colorWithRed:87/255.0 green:166/255.0 blue:133/255.0 alpha:1.0] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:30/2];
        [button addTarget:self action:@selector(closeClickButton:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 1;
        [_alertView addSubview:button];
    }
    return self;
}
-(void)closeClickButton:(id)sender
{
    [self removeFromSuperview];
}

@end
