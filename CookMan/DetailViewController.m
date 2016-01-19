//
//  DetailViewController.m
//  CookMan
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 gejiateng. All rights reserved.
//

#import "DetailViewController.h"
#import "StarView.h"
@interface DetailViewController ()
{
    UIImageView *_BigImgV; //头部大图
    UILabel *_nameLabel; //食物名称
    UILabel *_diffiLabel; //难度
    UILabel *_dateLabel; //所用时间
    StarView *_starView; //星星视图
}
@end

@implementation DetailViewController

- (instancetype)init{
    
    self = [super init];
   
    if (self) {
        
        [self loadMyView];
        
    }
    
    return self;
    
}
- (void)loadMyView{
    
    //头部大图
    [self BigImgView];
    
    //食物名称
    [self foodName];
    
    //难度和时间
    [self difficultyAndDate];
    
    //星星视图
    [self starView];
    
}
- (void)BigImgView{
    
    //头部大图
    _BigImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 300)];
    
    _BigImgV.image = [UIImage imageNamed:@"1.png"];
    
    [self.view addSubview:_BigImgV];
 
}
- (void)foodName{
    
    //食物名称
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, _BigImgV.frame.size.height +5, kScreenW -50*2, 40)];
    
        _nameLabel.backgroundColor = [UIColor redColor];
    
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    
    _nameLabel.font = [UIFont systemFontOfSize:25];
    
    _nameLabel.text = @"滕州菜煎饼";
    
    [self.view addSubview:_nameLabel];
    
}
- (void)difficultyAndDate{
    
    _diffiLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 350, (kScreenW -50 *2 -14)/2, 40)];
    
    _diffiLabel.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:_diffiLabel];
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake( kScreenW -(kScreenW -50 *2 -14)/2 -50, 350, (kScreenW -50 *2 -14)/2, 40)];
    
    _dateLabel.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:_dateLabel];
    
}
- (void)starView{
    
    _starView  = [StarView alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
    
    
    
    
    
    
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
