//
//  EFUser.h
//  E-flyer
//  用户表
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "BasicModel.h"
#import "EFCrowd.h"
#import <AVOSCloud.h>
@interface EFUser : AVUser<AVSubclassing>
@property(assign,nonatomic) double money;//金额

@property(assign,nonatomic) int type;//用户类型  0-商家  1-个人中心
@property(strong,nonatomic) EFCrowd *crowd;
@property(strong,nonatomic) AVFile *headImg;
@property(assign,nonatomic) float lat;//当前登录时所处的地理位置
@property(assign,nonatomic) float lng;
@end
