//
//  EFReciveOrder.h
//  E-flyer
//  用户领取记录
//  Created by 苗爽 on 16/4/22.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFUser.h"
#import "EFGood.h"
#import "BasicModel.h"
@class EFReciveOrder;
typedef void(^EFReceiveBlock)(NSArray <EFReciveOrder *> *);
@interface EFReciveOrder : BasicModel

@property(nonatomic,strong) EFUser *user;
@property(nonatomic,strong) EFGood *good;

//判断用户是否领取过该商品
+ (void)IsUserHaveReceiveWithGood:(EFGood *)good Finish:(void(^)(BOOL is))is;
//根据当前登录的商户账户获取其商品的领取记录
+ (void)userReceiveOrderWithBlock:(EFReceiveBlock)block;

@end
