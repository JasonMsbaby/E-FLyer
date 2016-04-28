//
//  BasicModel.h
//  E-flyer
//  LeanClould对象的基类
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "AVQuery+EFQuery.h"
#import <Foundation/Foundation.h>
#import <AVOSCloud.h>
#import "Constanst.h"

typedef NS_ENUM(NSInteger,EFLogType){
    EFLogTypeIn = 0,//充值
    EFLogTypeOut,//提现
    EFLogTypePublish,//发布
    EFLogTypeBack//商品下架 资金回退
};

typedef NS_ENUM(NSInteger,GoodStatus){
    GoodStatusNormal = 0,//正常
    GoodStatusWaittingPay = 1,//待支付
    GoodStatusPayError = 2,//支付失败
    GoodStatusDelete = 3,//已下架
    GoodStatusFinish = 4//已发放完毕
};

typedef NS_ENUM(NSInteger,PayType){
    PayTypeAliay = 0,//阿里支付
    PayTypeWeiXin = 1,//微信支付
    PayTypeYuEr = 2//余额支付
};


typedef void(^Success)();

typedef void(^Finish)(BOOL success);



typedef void(^callback)(NSArray *result,NSError *error);
@interface BasicModel : AVObject <AVSubclassing>

@end
