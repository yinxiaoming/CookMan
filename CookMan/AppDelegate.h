//
//  AppDelegate.h
//  CookMan
//
//  Created by 尹晓明 on 16/1/19.
//  Copyright © 2016年 尹晓明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"
#import "MMDrawerController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,WeiboSDKDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,retain)MMDrawerController*draw;
-(void)oauthFunc;
@end

