//
//  BaseModel.h
//  MovieTheater
//
//  Created by ios on 15-3-31.
//  Copyright (c) 2015年 文轩阁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

-(id)initWithDictionary:(NSDictionary*)dic;
-(void)setAttributes:(NSDictionary*)dic;

@property (nonatomic,copy) NSDictionary*map;

@end
