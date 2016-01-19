//
//  CeHuaViewController.h
//  UI自定义侧滑控制器
//
//  Created by wy on 15/11/10.
//  Copyright © 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CeHuaViewController : UIViewController

@property(nonatomic,retain)UIViewController *centerVC;
@property(nonatomic,retain)UIViewController *leftVC;

- (void)showOrHiddenLeftVC;

- (id)initWithCenterVC:(UIViewController *)centerVC LeftVC:(UIViewController *)leftVC;

@end
