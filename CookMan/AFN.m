//
//  AFN.m
//  CookMan
//
//  Created by 尹晓明 on 16/1/19.
//  Copyright © 2016年 尹晓明. All rights reserved.
//

#import "AFN.h"
@implementation AFN
//创建获取数据的类方法
+(void)getDataWithUrl:(NSString*)url parameters:(NSDictionary*)parameters block:(MyBlock)result{
    AFHTTPRequestOperationManager*manager=[AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        result(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"加载失败");
    }];


}
@end
