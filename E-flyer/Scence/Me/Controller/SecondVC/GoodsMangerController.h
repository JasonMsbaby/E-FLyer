//
//  GoodsMangerController.h
//  E-flyer
//  商品管理控制器
//  Created by Jason_Msbaby on 16/4/17.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFUser.h"
#import "BasicController.h"

//商品控制器查看时的枚举
//typedef NS_ENUM(NSInteger,GoodsMangerControllerType){
//    GoodsMangerControllerTypeMine = 0,//当登录用户自己查看时
//    GoodsMangerControllerTypeGuest,//当用户打开控制器时使用
//};


@interface GoodsMangerController : BasicController
@property(strong,nonatomic) EFUser *current;

@end
