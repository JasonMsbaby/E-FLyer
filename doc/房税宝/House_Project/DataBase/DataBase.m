//
//  DataBase.m
//  HouseProject
//
//  Created by lanou3g on 14-10-8.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "DataBase.h"

@implementation DataBase

#pragma mark --dataBase初始化
static sqlite3 * db = nil;

#pragma mark --关闭数据库
+ (void)closeDataBase
{
    int flag = sqlite3_close(db);
    if (flag == SQLITE_OK) {
        NSLog(@"数据库关闭成功");
        db = nil;
    }else{
        NSLog(@"数据库关闭失败");
    }
}

#pragma mark --打开房屋信息数据库
+ (sqlite3 *)openInforDataBase
{
    //如果数据库已经打开，则返回
    if (db != nil) {
        return db;
    }
    //创建文件管理对象
    NSFileManager *manger = [NSFileManager defaultManager];
    //获取bundel地址
    NSString *path = [[NSBundle mainBundle]pathForResource:@"HouseDataBase" ofType:@"sqlite"];
    
    //获取Caches路径
    NSString *cachepath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSLog(@"路径：%@",cachepath);
    //拼接获取数据库文件存储路径
    cachepath = [cachepath stringByAppendingString:@"/HouseDataBase.sqlite"];
    
    //判断cachepath路径下是已经有数据库文件。如果没有，则从bundel中拷贝到cachepath路径下
    if (![manger fileExistsAtPath:cachepath]) {
        //拷贝
        [manger copyItemAtPath:path toPath:cachepath error:nil];
    }
    //打开数据库,flag表示数据库打开操作的错误标识
    int flag =  sqlite3_open([cachepath UTF8String], &db);
    if (flag == SQLITE_OK) {
        NSLog(@"数据库打开成功");
    }else{
        NSLog(@"数据库打开失败");
    }
    return  db;

}



@end
