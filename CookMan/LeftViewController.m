//
//  LeftViewController.m
//  CookMan
//
//  Created by wy on 16/1/19.
//  Copyright © 2016年 wy. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //顶部用户登陆视图
    [self createUserView];
    
    //创建菜系表格
    [self createTableView];
    
    //底部设置按钮
    [self createSetView];
}

//底部设置按钮
- (void)createSetView
{
    UIView *setView = [[UIView alloc] initWithFrame:CGRectMake(0, 90+55+500+25, self.view.frame.size.width, 90)];
    setView.backgroundColor = [UIColor orangeColor];
    //userView.backgroundColor = [UIColor colorWithRed:200/255 green:200/255 blue:200/255 alpha:1];
    [self.view addSubview:setView];
    
    //设置按钮
    UIButton *setBtn = [[UIButton alloc] initWithFrame:CGRectMake(40, 10, 40, 40)];
    [setBtn setTitle:@"设置" forState:UIControlStateNormal];
    [setBtn addTarget:self action:@selector(setBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    [setView addSubview:setBtn];
    
    //收藏按钮
    UIButton *collectBtn = [[UIButton alloc] initWithFrame:CGRectMake(130, 10, 40, 40)];
    [collectBtn setTitle:@"收藏" forState:UIControlStateNormal];
    //[collectBtn setImage:[UIImage imageNamed:@"shoucang"] forState:UIControlStateNormal];
    [collectBtn addTarget:self action:@selector(colletBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    [setView addSubview:collectBtn];
    
    //夜间模式
    UIButton *nightBtn = [[UIButton alloc] initWithFrame:CGRectMake(220, 10, 40, 40)];
    [nightBtn setTitle:@"夜间" forState:UIControlStateNormal];
    [setView addSubview:nightBtn];
}

- (void)setBtnAct:(UIButton *)btn
{
    
}

- (void)colletBtnAct:(UIButton *)btn
{
    
}

//顶部用户登陆视图
- (void)createUserView
{
    //用户视图
    UIView *userView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 90)];
    userView.backgroundColor = [UIColor orangeColor];
    //userView.backgroundColor = [UIColor colorWithRed:200/255 green:200/255 blue:200/255 alpha:1];
    [self.view addSubview:userView];
    //头像
    UIImageView *userImg = [[UIImageView alloc] initWithFrame:CGRectMake(20, 25, 50, 50)];
    userImg.image = [UIImage imageNamed:@"smiley_001"];
    [userView addSubview:userImg];
    //登录按钮
    UIButton *login = [[UIButton alloc] initWithFrame:CGRectMake(90, 25, 80, 50)];
    [login setTitle:@"点击登录" forState:UIControlStateNormal];
    [userView addSubview:login];
    
    
    //返回首页
    UIView *homeView = [[UIView alloc] initWithFrame:CGRectMake(0, 90, kScreenW, 55)];
    homeView.backgroundColor = [UIColor colorWithRed:.99 green:.99 blue:.99 alpha:1];
    //首页按钮
    UIButton *backhome = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenW/3, 55)];
    [backhome setTitle:@"返回首页" forState:UIControlStateNormal];
    [backhome setImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
    backhome.backgroundColor =[UIColor yellowColor];
    [backhome setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    backhome.titleLabel.textAlignment = NSTextAlignmentLeft;
    [homeView addSubview:backhome];
    [self.view addSubview:homeView];
    
    
 
}

//创建菜系表格
- (void)createTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 145, self.view.frame.size.width-100, kScreenH-210)];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
   
}

#pragma mark ------UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell.backgroundColor = [UIColor whiteColor];
    }
    cell.textLabel.text = @"菜系";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
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
