//
//  RegistController.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "BasicController.h"
//定义该controller的用途
typedef NS_ENUM(NSInteger,RegistControllerType){
    RegistControllerTypeRegist = 1,//用于注册页面
    RegistControllerTypeForGetPwd//用于找回密码页面
};

@interface RegistController : BasicController
@property(nonatomic,assign) NSInteger RegistControllerType;
@end
