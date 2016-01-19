//
//  CeHuaViewController.m
//  UI自定义侧滑控制器
//
//  Created by wy on 15/11/10.
//  Copyright © 2015年 wy. All rights reserved.
//

#import "CeHuaViewController.h"

@interface CeHuaViewController ()

@end

@implementation CeHuaViewController

- (id)initWithCenterVC:(UIViewController *)centerVC LeftVC:(UIViewController *)leftVC
{
    self = [super init];
    
    if (self) {
       self.centerVC = centerVC;
        
        self.leftVC = leftVC;
    }
    return self;
}

//centerVC的setter方法
- (void)setCenterVC:(UIViewController *)centerVC
{
    //判断传入的中心控制器是否和原有的一致，不一致则
    if (_centerVC != centerVC) {
        //判断centerVC是否存在，有则移除
        if (_centerVC) {
            //移除原来的_centerVC
            [_centerVC.view removeFromSuperview];
        }
        //赋值新的中心控制器
        _centerVC = centerVC;
        [self.view addSubview:_centerVC.view];
    }
    
}

//leftVC的setter方法//1201891542053
- (void)setLeftVC:(UIViewController *)leftVC
{
    if (_leftVC != leftVC) {
        if (_leftVC) {
            [_leftVC.view removeFromSuperview];
        }
        _leftVC = leftVC;
        [self.view insertSubview:_leftVC.view belowSubview:_centerVC.view];
        _leftVC.view.hidden = YES;
    }
}

- (void)showOrHiddenLeftVC
{
    if (_leftVC.view.hidden) {
        
        [UIView animateWithDuration:.4 animations:^{
        
            _leftVC.view.hidden = NO;
            
            _centerVC.view.frame = CGRectMake(kScreenW-100, 0, kScreenW, kScreenH);
        }];
    }else{

        [UIView animateWithDuration:.4 animations:^{
            _centerVC.view.frame = [UIScreen mainScreen].bounds;
        } completion:^(BOOL finished) {
            _leftVC.view.hidden = YES;
        }];
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
