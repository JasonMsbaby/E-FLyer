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
typedef void(^EFReceiveBlock)(NSArray <EFReciveOrder *> *result);
@interface EFReciveOrder : BasicModel

@property(nonatomic,strong) EFUser *user;
@property(nonatomic,strong) EFGood *good;
@property(nonatomic,strong) EFUser *blongUser;

//判断用户是否领取过该商品
+ (void)IsUserHaveReceiveWithGood:(EFGood *)good Finish:(void(^)(BOOL is))is;
//根据当前登录的用户获取领取记录
+ (void)userReceiveOrderWithBlock:(EFReceiveBlock)block;
//根据当前商户获取其商品被领取记录
+ (void)allReceiveWithCurrentBarBlock:(EFReceiveBlock)block;
//根据商品获取领取过的用户列表
+(void)userListWithGoods:(EFGood *)good Block:(EFReceiveBlock)block;

@end
