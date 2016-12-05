//
//  UIAlertView+JavaScriptAlert.h
//  SecurityRoom
//
//  Created by 丁庆秋 on 16/6/20.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <UIKit/UIKit.h>
@import WebKit;

@interface UIWebView (JavaScriptAlert)

- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame;

@end
