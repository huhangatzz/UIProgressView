//
//  ProgressView.h
//  进度条
//
//  Created by huhang on 15/11/9.
//  Copyright (c) 2015年 huhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView

+ (instancetype)progressViewWithTitles:(NSArray *)titles;

/** 完成个数 */
@property (nonatomic,assign)NSInteger finishCount;

@end
