//
//  ProgressView.m
//  进度条
//
//  Created by huhang on 15/11/9.
//  Copyright (c) 2015年 huhang. All rights reserved.
//

#import "ProgressView.h"

@interface ProgressView()

@property (nonatomic,strong)NSMutableArray *titleLbArrs;
@property (nonatomic,strong)NSMutableArray *finishImVs;
@property (nonatomic,strong)NSMutableArray *middleViews;
@property (nonatomic,strong)NSArray *titles;

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width

@end

static const NSInteger imgWidth = 15;
static const NSInteger imgHeight = 15;

@implementation ProgressView

+ (instancetype)progressViewWithTitles:(NSArray *)titles{
 
    ProgressView *progressView = [[ProgressView alloc]initWithFrame:CGRectMake(0, 150, ScreenWidth, 80) titles:titles];
    return progressView;
}

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    if (self = [super initWithFrame:frame]) {
       
        _titles = titles;
        [self setupView];
    }
    return self;
}

#pragma mark 创建视图
- (void)setupView{
  
    _titleLbArrs = [NSMutableArray array];
    _finishImVs = [NSMutableArray array];
    _middleViews = [NSMutableArray array];
    
    for (int i = 0; i < _titles.count; i++) {
        //灰色图片
        UIImageView *nofinishImv = [[UIImageView alloc]initWithFrame:CGRectMake(25 + i * (CGRectGetWidth(self.frame) / _titles.count), 0, imgWidth, imgHeight)];
        nofinishImv.image = [UIImage imageNamed:@"icon_jindu_doing"];
        [_finishImVs addObject:nofinishImv];
        [self addSubview:nofinishImv];
        
        if (i < (_titles.count - 1)) {
            //中间大的道路
            UIView *middleView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nofinishImv.frame) - 0.5, CGRectGetMinY(nofinishImv.frame) + imgWidth / 3.5, (CGRectGetWidth(self.frame) - 2 * imgWidth) / _titles.count - 5, imgWidth / 2)];
            middleView.backgroundColor = [UIColor colorWithHexString:@"#DDDDDD"];
            [_middleViews addObject:middleView];
            [self addSubview:middleView];
        }
        
        //下面文字
       UILabel *titleLb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(nofinishImv.frame) - 5, CGRectGetMaxY(nofinishImv.frame) - 10, imgWidth * 3, imgWidth * 3)];
       titleLb.text = _titles[i];
        if (imgWidth <= 15) {
            titleLb.font = [UIFont boldSystemFontOfSize:imgWidth];
        }else{
            titleLb.font = [UIFont boldSystemFontOfSize:15];
        }
       titleLb.textColor = [UIColor colorWithHexString:@"999999"];
        [_titleLbArrs addObject:titleLb];
       [self addSubview:titleLb];
    }
}

#pragma mark 完成几个了
- (void)setFinishCount:(NSInteger)finishCount{
    
    if (_finishCount != finishCount) {
        [self setupView];
    }
    
    _finishCount = finishCount;
    
    for (int i = 0; i < finishCount; i++) {
        //蓝色图片
        UIImageView *finishImv = _finishImVs[i];
        finishImv.image = [UIImage imageNamed:@"icon_jindu_finish"];
        
        if (i < (_finishCount - 1)) {
            //中间大的道路
            UIView *middleView = _middleViews[i];
            middleView.backgroundColor = [UIColor colorWithHexString:@"#3492E9"];
        }
        
        //下面文字
        UILabel *finishLb = _titleLbArrs[i];
        finishLb.text = _titles[i];
        finishLb.textColor = [UIColor colorWithHexString:@"#3492E9"];
    }

}

@end
