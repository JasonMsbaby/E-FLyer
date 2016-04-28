//
//  EFLog.h
//  E-flyer
//  日志表
//  Created by 苗爽 on 16/4/24.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "BasicModel.h"
@class EFGood;
@class EFUser;

@interface EFLog : BasicModel
@property(nonatomic,strong) EFUser *user;
@property(nonatomic,assign) EFLogType type;//类型
@property(nonatomic,strong) NSString *source;//渠道
@property(nonatomic,assign) CGFloat money;
@property(nonatomic,strong) EFGood *good;

+ (void)saveLogWithType:(EFLogType)type Source:(NSString *)source Money:(CGFloat)money Good:(EFGood *)good;
+ (void)saveLogWithType:(EFLogType)type Source:(NSString *)source Money:(CGFloat)money Good:(EFGood *)good Finish:(void(^)(BOOL success))finish;

//根据当前登录的用户获取日志表
+ (void)LogWithBlock:(void(^)(NSArray<EFLog *>*))block;
//根据当前用户获取指定类型的日志
+ (void)LogWithType:(EFLogType)type Block:(void (^)(NSArray<EFLog *> *))block;

@end
