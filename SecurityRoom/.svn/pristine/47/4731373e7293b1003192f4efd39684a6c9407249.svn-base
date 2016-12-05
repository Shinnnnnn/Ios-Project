//
//  AppDelegate.m
//  SecurityRoom
//
//  Created by LJ on 16/3/31.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [NSThread sleepForTimeInterval:0.5];
    ViewController*vc=[[ViewController alloc] init];
    UINavigationController*nav=[[UINavigationController alloc] initWithRootViewController:vc];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation-quantouming"] forBarMetrics:UIBarMetricsDefault];
    [nav.navigationBar setShadowImage:[[UIImage alloc] init]];
//    UIImageView *barViw=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 88.0/1334*SCREEN_HEIGHT)];
//    barViw.image=[UIImage imageNamed:@"bg_titlebar"];
//    [nav.navigationBar addSubview:barViw];
//    UIImageView*titleImave=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 295.0/750*SCREEN_WIDTH, 75.0/1334*SCREEN_HEIGHT)];
//    titleImave.image=[UIImage imageNamed:@"ic_title"];
//    titleImave.center=barViw.center;
//    [barViw addSubview:titleImave];
    
//    //监测网络情况
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(reachabilityChanged:)
//                                                 name: kReachabilityChangedNotification
//                                               object: nil];
//    //初始化Reachability类，并添加一个监测的网址。
//    hostReach = [Reachability reachabilityWithHostName:@"http://221.6.15.170:18060"];
//    //开始监测
//    
//    [hostReach startNotifier];
    
    self.window.rootViewController=nav;
    return YES;
}
#pragma mark - 监测网络情况，当网络发生改变时会调用
- (void)reachabilityChanged:(NSNotification *)note {
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    NetworkStatus status = [curReach currentReachabilityStatus];
    
    switch (status)
    {
        case NotReachable:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"无网络连接"
                                                           delegate:nil
                                                  cancelButtonTitle:@"YES" otherButtonTitles:nil];
            [alert show];
            alert = nil;
            NSLog(@"收到通知---无网络");
        }
            break;
        case ReachableViaWiFi:// WiFi 连接
        {
            NSLog(@"收到通知---WiFi 连接");
        }
            break;
        case ReachableViaWWAN: // 蜂窝数据 3G 4G
        {
            NSLog(@"收到通知---蜂窝数据");
        }
            break;
        default:
            break;
    }
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
