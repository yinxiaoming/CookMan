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
#import "AFN.h"
#import "LeftViewController.h"
#import "AppDelegate.h"
#import "MMDrawerBarButtonItem.h"
@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray*_dataList;  //可变数组，存放model
    UITableView*_tableView;
    LeftViewController*_left;
}
@end

@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"popular";
    self.navigationController.navigationBar.backgroundColor=[UIColor redColor];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_home@2x.jpg"]];
//    [self loadMainList];
    [self createTableView];
    [self createLeftButton];
    
    MMDrawerController *draw = (MMDrawerController *)[[UIApplication sharedApplication].keyWindow rootViewController];
    [((LeftViewController*)draw.leftDrawerViewController) indexWithBlock:^(NSInteger list) {
        NSLog(@"---%ld---",list);
    }];

}
//获取主页面菜谱详情
-(void)loadMainList{
    
//    NSLog(@"block is ---%@",_left.block);
NSString*url=@"http://apis.juhe.cn/cook/query.php";
    NSDictionary*parameter=@{@"menu":@"红烧肉",@"key":@"c7f04bd8ebb1dea6416042bdb402f83d"};
    //初始化可变数组
    _dataList=[[NSMutableArray alloc]init];
    [AFN getDataWithUrl:url parameters:parameter block:^(id result) {
        NSLog(@"-----%@---",result);
        NSDictionary*dic=[result objectForKey:@"result"];
        NSArray*data=[dic objectForKey:@"data"];
        for (NSDictionary*dic in data) {
            NSArray*albums=[dic objectForKey:@"albums"];
            
            MainModel*model=[[MainModel alloc]initWithDictionary:dic];
            
            [_dataList addObject:model];
        }
        
        //重新刷新tableview
        [_tableView reloadData];
    }];

}
//创建tableview
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.backgroundColor=[UIColor whiteColor];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    _tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableView];


}
//返回单元格的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   // return _dataList.count;
    return 10;
}
//实例化单元格
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"MainTableViewCell" owner:self options:nil]lastObject];
    }
  //  cell.model=_dataList[indexPath.row];
    cell.backgroundColor=[UIColor clearColor];
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
    [btn setImage:[UIImage imageNamed:@"avatar_default@2x"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAct:) forControlEvents:UIControlEventTouchUpInside];
   
    UIBarButtonItem*leftBtn=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem=leftBtn;
    
    

}
//左侧按钮点击方法
-(void)btnAct:(UIButton*)btn{

    //获取到窗口的根视图，即为drawVC
    MMDrawerController *draw = (MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    //调用侧滑方法滑出左侧视图
    [draw toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    
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
