//
//  UIColor+colorValues.h
//  进度条
//
//  Created by huhang on 15/11/10.
//  Copyright (c) 2015年 huhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (colorValues)
//颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor*) colorWithHexString:(NSString*)color;
+ (UIColor *) colorWithHexString:(NSString *)color alpha:(float)alpha;
@end
