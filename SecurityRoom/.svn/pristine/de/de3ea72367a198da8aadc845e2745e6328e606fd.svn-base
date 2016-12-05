//
//  headerView.m
//  jingWangAPP
//
//  Created by LJ on 15/12/7.
//  Copyright © 2015年 jingWang. All rights reserved.
//

#import "headerView.h"

@implementation headerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString*)title ImageName:(NSString*)imageName;
{
    self=[super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor=[UIColor whiteColor];
//        self.layer.borderColor=[UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0].CGColor;
//        self.layer.borderWidth=0.5;
        /*
        UIView*leftView=[[UIView alloc] initWithFrame:CGRectMake((75.0+100.0)/750*SCREEN_WIDTH, ((60.0/1334)*SCREEN_HEIGHT-2.0)/2, (131.0/750)*SCREEN_WIDTH, 1.0/2)];
        leftView.backgroundColor=[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
        
        UILabel*titleLable=[[UILabel alloc] initWithFrame:CGRectMake(leftView.frame.origin.x+leftView.frame.size.width+(14.0/750)*SCREEN_WIDTH, 0, SCREEN_WIDTH-(leftView.frame.origin.x+leftView.frame.size.width+(14.0/750)*SCREEN_WIDTH)*2, self.frame.size.height)];
        titleLable.center=self.center;
        titleLable.adjustsFontSizeToFitWidth=YES;
        titleLable.text=title;
        titleLable.font=[UIFont systemFontOfSize:14.0];
        titleLable.textAlignment=NSTextAlignmentCenter;
        titleLable.textColor=[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
        [self addSubview:titleLable];
        
        [self addSubview:leftView];
        UIView*rightView=[[UIView alloc] initWithFrame:CGRectMake(titleLable.frame.origin.x+titleLable.frame.size.width+(14.0/750)*SCREEN_WIDTH, ((60.0/1334)*SCREEN_HEIGHT-2.0)/2,leftView.frame.size.width, 1.0/2)];
        rightView.backgroundColor=[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
        [self addSubview:rightView];
        */
        
        UIImageView*ima=[[UIImageView alloc] initWithFrame:CGRectMake(20.0/750*SCREEN_WIDTH, self.center.y-60.0/1334*SCREEN_HEIGHT/2, 60.0/750*SCREEN_WIDTH, 60.0/1334*SCREEN_HEIGHT)];
        ima.image=[UIImage imageNamed:imageName];
        [self addSubview:ima];
        UILabel*titleLable=[[UILabel alloc] initWithFrame:CGRectMake(ima.frame.origin.x+ima.frame.size.width+(10.0/1334)*SCREEN_HEIGHT, 0, 300.0/750*SCREEN_WIDTH, self.frame.size.height)];
        titleLable.text=title;
        titleLable.textColor=[UIColor lightGrayColor];
        titleLable.font=[UIFont systemFontOfSize:30/2];
        titleLable.textAlignment=NSTextAlignmentLeft;
        titleLable.textColor=[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
        [self addSubview:titleLable];
    }
    return self;
}

@end
