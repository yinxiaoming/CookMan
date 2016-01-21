//
//  MakeView.m
//  CookMan
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 尹晓明. All rights reserved.
//

#import "MakeView.h"
#import "MakeTableViewCell.h"
@implementation MakeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createTable];
        
    }
    return self;
}
- (void)createTable{
    
    UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    
    tableV.delegate = self;
    
    tableV.dataSource = self;
    
    [self addSubview:tableV];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MakeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shicaiCell"];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MakeTableViewCell" owner:nil options:nil]lastObject];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 270;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
