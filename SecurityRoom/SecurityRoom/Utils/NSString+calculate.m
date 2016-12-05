//
//  NSString+calculate.m
//  NSStringDrawing
//
//  Created by yestae on 15/12/17.
//  Copyright © 2015年 zhangji. All rights reserved.
//

#import "NSString+calculate.h"
#import "UIKit/UIKit.h"

@implementation NSString (calculate)

- (float)heightWithWidth:(float)width font:(float)font
{
    // 计算文本的大小
    CGSize sizeToFit = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) // 用于计算文本绘制时占据的矩形块
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                       attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}        // 文字的属性
                                          context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
    return sizeToFit.height;
}
@end
