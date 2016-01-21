//
//  DetailViewController.m
//  CookMan
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 gejiateng. All rights reserved.
//

#import "DetailViewController.h"
#import "StarView.h"
#import "MyTableViewCell.h"
@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView *_backView;
    UIImageView *_BigImgV; //头部大图
    UILabel *_nameLabel; //食物名称
    UILabel *_diffiLabel; //难度
    UILabel *_dateLabel; //所用时间
    StarView *_starView; //星星视图
    UILabel *_likeCount; //收藏人数
    
}
@end

@implementation DetailViewController

- (instancetype)init{
    
    self = [super init];
   
    if (self) {
        
        [self createTableView];
        
    }
    
    return self;
    
}
- (void)createTableView{
    
    [self loadMyView];
    
    UITableView *detailTableV = [[UITableView alloc]initWithFrame:self.view.bounds];
    
    detailTableV.tableHeaderView = _backView;
    
    detailTableV.delegate = self;
    
    detailTableV.dataSource = self;
    
    [self.view addSubview:detailTableV];
    
    
}
- (void)loadMyView{
    
    //背景视图
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 500)];
    
    //头部大图
    [self BigImgView];
    
    //食物名称
    [self foodName];
    
    //难度和时间
    [self difficultyAndDate];
    
    //星星视图
    [self starView];
    
    //收藏人数
    [self LikeCount];
    
    
    
}
- (void)BigImgView{
    
    //头部大图
    _BigImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 300)];
    
    _BigImgV.backgroundColor = [UIColor orangeColor];
    
    _BigImgV.image = [UIImage imageNamed:@"1.png"];
    
    [_backView addSubview:_BigImgV];
 
}
- (void)foodName{
    
    //食物名称
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, _BigImgV.frame.size.height +5, kScreenW -50*2, 40)];
    
        _nameLabel.backgroundColor = [UIColor redColor];
    
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    
    _nameLabel.font = [UIFont systemFontOfSize:25];
    
    _nameLabel.text = @"滕州菜煎饼";
    
    [_backView addSubview:_nameLabel];
    
}
- (void)difficultyAndDate{
    
    _diffiLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 350, (kScreenW -50 *2 -14)/2, 40)];
    
    _diffiLabel.backgroundColor = [UIColor greenColor];
    
    _diffiLabel.textAlignment = NSTextAlignmentCenter;
    
    _diffiLabel.text = @"难度:简单";
    
    [_backView addSubview:_diffiLabel];
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake( kScreenW -(kScreenW -50 *2 -14)/2 -50, 350, (kScreenW -50 *2 -14)/2, 40)];
    
    _dateLabel.backgroundColor = [UIColor yellowColor];
    
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    
    _dateLabel.text = @"时间:三十分钟";
    
    [_backView addSubview:_dateLabel];
    
}
- (void)starView{
    
    _starView  = [[StarView alloc]initWithFrame:CGRectMake((kScreenW -220)/2, 395, 220, 43)];
    
    [_backView addSubview:_starView];
      
}
- (void)LikeCount{
    
    _likeCount = [[UILabel alloc]initWithFrame:CGRectMake((kScreenW -180)/2, 445, 180, 40)];
    
    _likeCount.backgroundColor = [UIColor grayColor];
    
    _likeCount.textAlignment = NSTextAlignmentCenter;
    
    _likeCount.text = @"1345679009人收藏";
    
    [_backView addSubview:_likeCount];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell" owner:nil options:nil]lastObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
       
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return kScreenH -100;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
