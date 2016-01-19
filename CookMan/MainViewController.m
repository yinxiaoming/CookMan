//
//  MainViewController.m
//  CookMan
//
//  Created by 尹晓明 on 16/1/19.
//  Copyright © 2016年 尹晓明. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "DetailViewController.h"
@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"popular";
    self.navigationController.navigationBar.backgroundColor=[UIColor redColor];
    [self createTableView];
    
}
//创建tableview
-(void)createTableView{
    UITableView*tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.backgroundColor=[UIColor whiteColor];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];


}
//返回单元格的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;

}
//实例化单元格
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"MainTableViewCell" owner:self options:nil]lastObject];
    }
    return cell;
}//返回单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 400;

}
//单元格单击方法，跳转到详情界面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//弹出详情界面
    DetailViewController*detail=[[DetailViewController alloc]init];
    [self.navigationController pushViewController:detail animated:YES];

}
//导航栏左侧列表按钮
-(void)createLeftButton{
    UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAct:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*leftBtn=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem=leftBtn;
    


}
//左侧按钮点击方法
-(void)btnAct:(UIButton*)btn{
//弹出左侧滑列表

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
