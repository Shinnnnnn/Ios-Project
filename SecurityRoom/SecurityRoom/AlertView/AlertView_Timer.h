//
//  AlertView_Timer.h
//  SecurityRoom
//
//  Created by zte_gdy on 16/4/4.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertView_Timer : UIView
@property (nonatomic,strong) UIView * alertView;
@property (nonatomic,assign)NSInteger jishiTime;
@property (nonatomic,strong)NSTimer*myTimer;
- (void)distributionNotesShow;
@end
