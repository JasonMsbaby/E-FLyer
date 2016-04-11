//
//  JsonTool.h
//  HouseProject
//
//  Created by lanou3g on 14-10-8.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义block
typedef void(^Block)(id param);

@interface JsonTool : NSObject

#pragma mark --判断当前网络状态
- (NSInteger)isConnectionAvailable;
#pragma mark --提示所用当前网络
- (void)connectionAlert:(NSInteger)flag;
#pragma mark -- 网络请求
- (void)JsonDictionaryWithURL:(NSString *)URL andBlock:(Block)datablock;

@end
