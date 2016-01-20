//
//  AppDelegate.m
//  CookMan
//
//  Created by 尹晓明 on 16/1/19.
//  Copyright © 2016年 尹晓明. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "LeftViewController.h"

#import "MMDrawerController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    //初始化主界面视图控制器
    MainViewController*main=[[MainViewController alloc]init];
    
    //创建导航控制器
    UINavigationController*nav=[[UINavigationController alloc]initWithRootViewController:main];
    nav.view.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    LeftViewController*left=[[LeftViewController alloc]init];
    MMDrawerController*drawViewController=[[MMDrawerController alloc]initWithCenterViewController:nav leftDrawerViewController:left];
    
    drawViewController.maximumLeftDrawerWidth=kScreenW-100;
    drawViewController.openDrawerGestureModeMask=MMOpenDrawerGestureModeAll;
    drawViewController.closeDrawerGestureModeMask=MMCloseDrawerGestureModeAll;

    self.window.rootViewController=drawViewController;
    
    
    //调用授权方法
   // [self oauthFunc];
    return YES;
}

////创建授权方法
-(void)oauthFunc{
    //调试
    [WeiboSDK enableDebugMode:YES];
    //向微博注册第三方应用
    [WeiboSDK registerApp:kAppKey];
    NSLog(@"token is %@",kAccessToken);
    //判断如果不存在token
    if (!kAccessToken) {
        //初始化请求
        WBAuthorizeRequest*request=[WBAuthorizeRequest request];
        //设置权限
        request.scope=@"all";
        //设置权限回调页
        request.redirectURI=kRedirectURI;
        
        //发送请求
        [WeiboSDK sendRequest:request];
    }

}
//重写代理方法
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}
//-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//{
//    return [WeiboSDK handleOpenURL:url delegate:self];
//}
////接收响应
-(void)didReceiveWeiboResponse:(WBBaseResponse *)response{
    NSString*token=[(WBAuthorizeResponse*)response accessToken];
    //将token存储在本地
    [[NSUserDefaults standardUserDefaults]setObject:token forKey:@"token"];
    //将刷新口令持久化
    [[NSUserDefaults standardUserDefaults]setObject:[(WBAuthorizeResponse*)response refreshToken] forKey:@"refreshToken"];
    
        NSLog(@"userid is:%@",[(WBAuthorizeResponse *)response userID]);

}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
