//
//  ShowBMKMap.h
//  E-flyer
//  百度地图选点
//  Created by Jason_Msbaby on 16/4/13.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFBMKModel.h"
#import "BasicController.h"
typedef void(^BMKResultBlock)(EFBMKModel *model);
@interface ShowBMKMap : BasicController
@property(copy,nonatomic)BMKResultBlock block;

@end

