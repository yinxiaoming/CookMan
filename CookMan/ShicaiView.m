//
//  ShicaiView.m
//  CookMan
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 尹晓明. All rights reserved.
//

#import "ShicaiView.h"
#import "ShicaiTableViewCell.h"
@implementation ShicaiView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createTableView];
        
    }
    return self;
}
- (void)createTableView{
    
    UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    
    tableV.delegate = self;
    
    tableV.dataSource = self;
    
    [self addSubview:tableV];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShicaiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shicaiCell"];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ShicaiTableViewCell" owner:nil options:nil]lastObject];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
