//
//  MyTableViewCell.m
//  CookMan
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 尹晓明. All rights reserved.
//

#import "MyTableViewCell.h"
#import "ViewController.h"
#import "ShicaiView.h"
#import "MakeView.h"
@implementation MyTableViewCell
{
    ShicaiView *shicaiView;
    MakeView *makeView;
}
- (void)awakeFromNib {
    
    [self createView];
    
    [self createSegment];
    
}
- (void)createView{
    
    shicaiView = [[ShicaiView alloc]initWithFrame:CGRectMake(0, 40, kScreenW, kScreenH -100)];
    
    [self addSubview:shicaiView];
    
    
    
    makeView = [[MakeView alloc]initWithFrame:CGRectMake(0, 40, kScreenW, kScreenH -100)];
    
    makeView.backgroundColor = [UIColor redColor];
    
    [self addSubview:makeView];
    
    [self bringSubviewToFront:shicaiView];
}
- (void)createSegment{
    
    NSArray *items = @[@"食材",@"做法"];
    //初始化
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:items];
    
    //设置frame属性
    segment.frame = CGRectMake(0, 0, kScreenW, 40);
    
    //添加到窗口
    [self addSubview:segment];
    
    //初始化默认选择的按钮段
    segment.selectedSegmentIndex = 0;
    
    //添加点击响应事件
    [segment addTarget:self action:@selector(segmentAct:) forControlEvents:UIControlEventValueChanged];
    
    //设置背景颜色
    segment.tintColor = [UIColor cyanColor];

  
    
}
- (void)segmentAct:(UISegmentedControl *)segment{
    
    if (segment.selectedSegmentIndex ==0) {
        
        [self bringSubviewToFront:shicaiView];
        
    }else if (segment.selectedSegmentIndex == 1){
        
       [self bringSubviewToFront:makeView];
        
    }
 
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
