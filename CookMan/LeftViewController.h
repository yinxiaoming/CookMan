//
//  LeftViewController.h
//  CookMan
//
//  Created by wy on 16/1/19.
//  Copyright © 2016年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"
typedef void(^Myblock) (NSInteger list);
@interface LeftViewController : UIViewController<WeiboSDKDelegate>

@property(nonatomic,copy)Myblock block;

-(void)indexWithBlock:(Myblock)block;
@end
