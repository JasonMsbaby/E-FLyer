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
@class EFGood;
typedef void(^GoodFinshBlock)(NSArray<EFGood *> *result);

@interface EFGood :BasicModel

@property(strong,nonatomic) NSString *title;//标题
@property(strong,nonatomic) NSString *content;//内容
@property(strong,nonatomic) EFCategroy *categroy;//类别
@property(strong,nonatomic) AVFile *video;//图片或者视频
@property(strong,nonatomic) AVFile *img;//传单图片
@property(strong,nonatomic) NSString *question;//问题
@property(strong,nonatomic) NSString *answer;//答案
@property(assign,nonatomic) double price;//价格
@property(assign,nonatomic) NSInteger count;//数量
@property(assign,nonatomic) NSInteger receivedCount;//已领取数量
@property(strong,nonatomic) EFUser *blongUser;//所属用户
@property(strong,nonatomic) EFCrowd *crowd;//针对人群
@property(strong,nonatomic) EFBMKModel *address;//针对区域
@property(strong,nonatomic) AVGeoPoint *location;//发布的经纬度
@property(assign,nonatomic) float scope;//范围km
@property(assign,nonatomic) int status;//状态 1-正常 2-待支付  3-支付失败  4-已下架
@property(assign,nonatomic) BOOL recommend;//是否推荐


//分页 分类 分位置 分人群 (进入二级目录下使用)
+ (void)loadDataWithCategroy:(EFCategroy *)categroy PageIndex:(NSInteger)index Block:(GoodFinshBlock)block;
//今日推荐的  最多六条数据
+ (void)loadDataWithTodyRecmomandBlock:(GoodFinshBlock)block;
//最新数据
+(void)loadDataWithNewIndex:(NSInteger)index Block:(GoodFinshBlock)block;
//获取指定用户发布的数据
+ (void)loadDataWithBelongUser:(EFUser *)user Block:(GoodFinshBlock)block;
//用户回答问题领取奖励
+ (void)reveiveMoneyWithGood:(EFGood *)good Answer:(NSString *)answer FinishBlock:(void(^)())block;

@end
