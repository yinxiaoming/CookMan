//
//  AFN.h
//  CookMan
//
//  Created by 尹晓明 on 16/1/19.
//  Copyright © 2016年 尹晓明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^MyBlock)(id result);

@interface AFN : NSObject

//创建获取数据的类方法
+(void)getDataWithUrl:(NSString*)url parameters:(NSDictionary*)parameters block:(MyBlock)result;
@end
