//
//  StarView.m
//  葛加滕项目一
//
//  Created by mac on 15/11/23.
//  Copyright © 2015年 gejiateng. All rights reserved.
//

#import "StarView.h"

@implementation StarView
{
    UIView *yellowV;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//如果通过init方法初始化星星视图对象那么该方法将作为入口方法
- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
       
        [self creatStarView];
        
    }
    return self;
}
- (void)creatStarView{
   
    UIImage *grayImg = [UIImage imageNamed:@"gray@2x"];
    UIImage *yellowImg = [UIImage imageNamed:@"yellow@2x"];
    
    //获取图片宽高
    CGFloat width = yellowImg.size.width;
    CGFloat height = yellowImg.size.height;
    
    //创建灰色星星视图
    
    UIView *_grayV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width*5, height)];
    //图片平铺展示
    _grayV.backgroundColor = [UIColor colorWithPatternImage:grayImg];
    
    [self addSubview:_grayV];
    
    
    yellowV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width*5, height)];
    //图片平铺展示
    yellowV.backgroundColor = [UIColor colorWithPatternImage:yellowImg];
    
    [self addSubview:yellowV];
    
    //获取比例系数
    CGFloat scale = self.frame.size.width/(width * 5);
    
    _grayV.transform = CGAffineTransformMakeScale(scale, scale);
    
    yellowV.transform = CGAffineTransformMakeScale(scale, scale);
    
    _grayV.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    yellowV.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
}
- (void)setStarRatingFinal:(NSString *)StarRatingFinal{
   
    CGFloat scale = [StarRatingFinal floatValue]/10.0;
    
    CGFloat width = self.frame.size.width*scale;
    
    yellowV.frame = CGRectMake(0, 0, width, self.frame.size.height);
    
    
}

//如果星星视图通过xib画出来的，则系统默认调用该方法，作为入口方法
- (void)awakeFromNib{
    
    [self creatStarView];
    
}
@end
