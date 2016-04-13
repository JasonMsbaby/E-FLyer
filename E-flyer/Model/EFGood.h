//
//  EFGood.h
//  E-flyer
//  商品信息实体
//  Created by Jason_Msbaby on 16/4/10.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <AVOSCloud.h>
#import "EFCity.h"
#import "EFCrowd.h"
#import "EFCategroy.h"
#import "BasicModel.h"
#import "EFUser.h"
#import "EFBMKModel.h"
#import <Foundation/Foundation.h>

@interface EFGood :BasicModel
@property(strong,nonatomic) NSString *title;//标题
@property(strong,nonatomic) NSString *content;//内容
@property(strong,nonatomic) EFCategroy *categroy;//类别
@property(strong,nonatomic) AVFile *file;//图片或者视频
@property(strong,nonatomic) NSString *question;//问题
@property(strong,nonatomic) NSString *answer;//答案
@property(assign,nonatomic) double *price;//价格
@property(assign,nonatomic) NSInteger count;//数量
@property(assign,nonatomic) NSInteger receivedCount;//已领取数量
@property(strong,nonatomic) EFUser *blongUser;//所属用户
@property(strong,nonatomic) EFCrowd *crowd;//针对人群
@property(strong,nonatomic) EFBMKModel *address;//针对区域
@property(assign,nonatomic) BOOL enable;//是否上架
@property(assign,nonatomic) BOOL recommend;//是否推荐
@end
