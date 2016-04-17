//
//  EFGood.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/10.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <BaiduMapAPI_Utils/BMKGeometry.h>
#import "EFGood.h"

@implementation EFGood
@dynamic title;//标题
@dynamic content;//内容
@dynamic video;//视频
@dynamic img;
@dynamic categroy;//类别
@dynamic question;//问题
@dynamic answer;//答案
@dynamic price;//价格
@dynamic count;//数量
@dynamic receivedCount;//已领取数量
@dynamic blongUser;//所属用
@dynamic crowd;//针对人群
@dynamic address;//针对区域
@dynamic status;//
@dynamic location;
@dynamic scope;
@dynamic recommend;//是否推荐

+ (void)load{
    [super load];
    [self registerSubclass];
}

//今日推荐
+(void)loadDataWithTodyRecmomandBlock:(GoodFinshBlock)block{
    
}
//最新上架
+(void)loadDataWithNewIndex:(NSInteger)index Block:(GoodFinshBlock)block{
    EFUser *currentUser = [EFUser currentUser];
    if (currentUser == nil) {
        [self loadDataWithCategroy:nil Crowd:nil PageIndex:index PageCount:10 Block:^(NSArray<EFGood *> *result) {
            block(result);
        }];
    }
    [self loadDataWithCategroy:nil Crowd:currentUser.crowd PageIndex:index PageCount:10 Block:^(NSArray<EFGood *> *result) {
        block(result);
    }];
}

//请求通用方法
+ (void)loadDataWithCategroy:(EFCategroy *)categroy Crowd:(EFCrowd *)crowd PageIndex:(NSInteger)pageIndex PageCount:(NSInteger)pageCount Block:(GoodFinshBlock)block{
    if (pageIndex == 0) {
        pageIndex = 1;
    }
    if (pageCount == 0) {
        pageCount = pageSize;
    }
    
    AVQuery *goodsQuery = [EFGood query];
    [goodsQuery includeKey:@"file"];
    [goodsQuery includeKey:@"address"];
    [goodsQuery includeKey:@"crowd"];
    [goodsQuery includeKey:@"blongUser"];
    [goodsQuery includeKey:@"categroy"];
    [goodsQuery orderByDescending:@"createdAt"];
    if (categroy != nil) {
        [goodsQuery whereKey:@"categroy" equalTo:categroy];
    }
    
    NSMutableArray *crowds = [NSMutableArray array];
    [crowds addObject:[EFCrowd shareInstance].data[0]];
    if (crowd != nil) {
        [crowds addObject:crowd];
    }
    [goodsQuery whereKey:@"crowd" containedIn:crowds];
    
    
    goodsQuery.limit = pageCount;
    goodsQuery.skip = (pageIndex-1)*pageCount;
    [goodsQuery findObjectsInBackgroundWithSuccess:^(NSArray *result) {
        if (block != nil) {
            block([self nearLocationInArray:result]);
        }
    }];
}



+ (NSArray<EFGood *> *)nearLocationInArray:(NSArray<EFGood *> *)arr{
    NSMutableArray *result = [NSMutableArray array];
    CGPoint currentLocation = currentLocation = CGPointFromString([[NSUserDefaults standardUserDefaults] objectForKey:@"currentLocation"]);;//当前地理位置
//    EFUser *currentUser = [EFUser currentUser];
//    if (currentUser== nil) {
//        currentLocation = CGPointFromString([[NSUserDefaults standardUserDefaults] objectForKey:@"currentLocation"]);
//    }else{
//        currentLocation = CGPointMake(currentUser.lng, currentUser.lat);
//    }
    CLLocationCoordinate2D coor2D_current = CLLocationCoordinate2DMake(currentLocation.y,currentLocation.x);
    //循环遍历  查找位置符合的数据
    for (EFGood *g in arr) {
        if (g) {
            CLLocationCoordinate2D coor2D_center = CLLocationCoordinate2DMake(g.address.lat,g.address.lng);
            NSLog(@"当前位置：%lf,%lf，圆心：%lf,%lf，半径：%lf",coor2D_current.latitude,coor2D_current.longitude,coor2D_center.latitude,coor2D_center.longitude,g.address.scope/2);
            if (g.address == nil) {
                [result addObject:g];
            }else{
                BOOL isIn = BMKCircleContainsCoordinate(coor2D_current, coor2D_center, g.address.scope/2);
                if (isIn) {
                    [result addObject:g];
                }
            }
        }
    }
    return  result;
}

@end
