//
//  DataBase.h
//  HouseProject
//
//  Created by lanou3g on 14-10-8.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DataBase : NSObject
/*
#pragma mark --打开数据库
+ (sqlite3 *)openDataBase;
 */

#pragma mark --关闭数据库
+ (void)closeDataBase;

#pragma mark --打开数据库
+ (sqlite3 *)openInforDataBase;


@end
