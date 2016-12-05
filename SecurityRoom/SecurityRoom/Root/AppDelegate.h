//
//  AppDelegate.h
//  SecurityRoom
//
//  Created by LJ on 16/3/31.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    Reachability *hostReach;
}
@property (strong, nonatomic) UIWindow *window;


@end

