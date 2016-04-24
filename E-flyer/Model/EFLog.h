//
//  EFLog.h
//  E-flyer
//  日志表
//  Created by 苗爽 on 16/4/24.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFUser.h"
#import "EFGood.h"
#import "BasicModel.h"
typedef NS_ENUM(NSInteger,EFLogType){
    EFLogTypeIn = 0,//充值
    EFLogTypeOut,//提现
    EFLogTypePublish//发布
};
@interface EFLog : BasicModel
@property(nonatomic,strong) EFUser *user;
@property(nonatomic,assign) EFLogType type;
@property(nonatomic,assign) CGFloat money;
@property(nonatomic,strong) EFGood *good;

//根据当前登录的用户获取日志表
+ (void)LogWithBlock:(void(^)(NSArray<EFLog *>*))block;

@end
