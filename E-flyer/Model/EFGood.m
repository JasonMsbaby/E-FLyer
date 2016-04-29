//
//  EFGood.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/10.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFReciveOrder.h"
#import "ToolUtils.h"
#import <BaiduMapAPI_Utils/BMKGeometry.h>
#import "EFGood.h"
#import "EFCrowd.h"
#import "EFUser.h"
#import "EFCity.h"
#import "EFBMKModel.h"
#import "EFCategroy.h"
#import "EFLog.h"

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
@dynamic status;//商品状态
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
    EFCrowd *crowd = nil;
    if (currentUser != nil) {
        crowd = currentUser.crowd;
    }
    [self loadDataWithCategroy:nil Crowd:crowd PageIndex:index PageCount:kPageSize Block:^(NSArray<EFGood *> *result) {
        block(result);
    }];
}



//获取指定用户发布的数据
+ (void)loadDataWithBelongUser:(EFUser *)user Block:(GoodFinshBlock)block{
    AVQuery *goodsQuery = [EFGood query];
    [goodsQuery includeKey:@"file"];
    [goodsQuery includeKey:@"address"];
    [goodsQuery includeKey:@"crowd"];
    [goodsQuery includeKey:@"blongUser"];
    [goodsQuery includeKey:@"categroy"];
    [goodsQuery orderByDescending:@"updatedAt"];
    [goodsQuery whereKey:@"blongUser" equalTo:user];
    [goodsQuery findObjectsInBackgroundWithSuccess:^(NSArray *result) {
        if (block != nil) {
            block(result);
        }
    }];
}
//进入二级页面分类请求
+(void)loadDataWithCategroy:(EFCategroy *)categroy PageIndex:(NSInteger)index Block:(GoodFinshBlock)block{
    EFUser *currentUser = [EFUser currentUser];
    EFCrowd *crowd = nil;
    if (currentUser != nil) {
        crowd = currentUser.crowd;
    }
    [self loadDataWithCategroy:categroy Crowd:crowd PageIndex:index PageCount:kPageSize Block:^(NSArray<EFGood *> *result) {
        if (block != nil) {
            block(result);
        }
    }];
}

//用户领取
+ (void)reveiveMoneyWithGood:(EFGood *)good Answer:(NSString *)answer FinishBlock:(void (^)())block{
#warning 此处应该先获取最新的商品详情后再进行相应的操作，否则会产生逻辑错误
    if (good.receivedCount >= good.count) {
        [SVProgressHUD showErrorWithStatus:@"您来晚了,已经领取光了..."];
        return;
    }
    if (![good.answer isEqualToString:answer]) {
        [SVProgressHUD showErrorWithStatus:@"答案错误"];
        return;
    }
    if ([EFUser currentUser] != nil) {
        [SVProgressHUD showWithStatus:@"正在领取奖励..."];
        [EFReciveOrder IsUserHaveReceiveWithGood:good Finish:^(BOOL is) {
            if (!is) {
                good.receivedCount += 1;
                [good saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        EFUser *currentUser = [EFUser currentUser];
                        currentUser.money += good.price;
                        [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                            if (succeeded) {
                                
                                EFReciveOrder *order = [EFReciveOrder object];
                                order.user = currentUser;
                                order.good = good;
                                [order saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                    if (succeeded) {
                                        [SVProgressHUD showSuccessWithStatus:@"成功"];
                                        if (block != nil) {
                                            block();
                                        }
                                    }else{
                                        [SVProgressHUD showErrorWithStatus:[ToolUtils stringWithError:error]];
                                    }
                                }];
                                
                                
                            }else{
                                [SVProgressHUD showErrorWithStatus:[ToolUtils stringWithError:error]];
                            }
                        }];
                    }else{
                        [SVProgressHUD showErrorWithStatus:[ToolUtils stringWithError:error]];
                    }
                }];
            }else{
                [SVProgressHUD showErrorWithStatus:@"您已经领取过了"];
            }
        }];
        
    }else{
        [SVProgressHUD showErrorWithStatus:@"请登录后操作"];
    }
    
    
    
}

//发布商品
+ (void)publishWithType:(PayType)type Good:(EFGood *)good Success:(Success)success{
    CGFloat money = good.price*good.count;
    EFUser *currentUser = [EFUser currentUser];
    if (currentUser == nil) {
        [SVProgressHUD showErrorWithStatus:@"您未登录,请登录后发布"];
        return;
    }
    switch (type) {
        case PayTypeAliay:
        {
            [SVProgressHUD showInfoWithStatus:@"测试版本，暂不支持"];
        }
            break;
        case PayTypeWeiXin:
        {
            [SVProgressHUD showInfoWithStatus:@"测试版本，暂不支持"];
        }
            break;
        case PayTypeYuEr:
        {
            if (money>currentUser.money) {
                [SVProgressHUD showErrorWithStatus:@"账户余额不足,请充值后再支付"];
            }else{
                [SVProgressHUD showWithStatus:@"正在发布,请稍后..."];
#warning 此处扣除金额应该做线程处理
                currentUser.money = currentUser.money - money;
                [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        good.status = GoodStatusNormal;
                        [good saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                            if (succeeded) {
                                [EFLog saveLogWithType:(EFLogTypePublish) Source:good.title Money:money Good:good];
                                success();
                            }else{
                                [SVProgressHUD showErrorWithStatus:[ToolUtils stringWithError:error]];
                            }
                        }];
                    }else{
                        [SVProgressHUD showErrorWithStatus:[ToolUtils stringWithError:error]];
                    }
                }];
            }
            
        }
            break;
            
        default:
            break;
    }
    
}

//商品下架
+ (void)unShelveGood:(EFGood *)good Success:(void(^)())success{
    //第一步余额回退
    EFUser *currentUser = [EFUser currentUser];
    if (currentUser != nil) {
        CGFloat money = (good.count - good.receivedCount)*good.price;
        currentUser.money += money;
        [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                //第二步 商品改变状态
                good.status = GoodStatusDelete;
                good.count = 0;
                good.receivedCount = 0;
                [good saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        //第三步 保存日志
                        [EFLog saveLogWithType:(EFLogTypeBack) Source:@"账户余额" Money:money Good:good];
                        success();
                    }else{
                        [SVProgressHUD showErrorWithStatus:[ToolUtils stringWithError:error]];
                    }
                }];
                
            }else{
                [SVProgressHUD showErrorWithStatus:[ToolUtils stringWithError:error]];
            }
        }];
    }
    
}

//商品续费












//请求通用方法
+ (void)loadDataWithCategroy:(EFCategroy *)categroy Crowd:(EFCrowd *)crowd PageIndex:(NSInteger)pageIndex PageCount:(NSInteger)pageCount Block:(GoodFinshBlock)block{
    if (pageIndex == 0) {
        pageIndex = 1;
    }
    if (pageCount == 0) {
        pageCount = kPageSize;
    }
    
    AVQuery *goodsQuery = [EFGood query];
    [goodsQuery includeKey:@"file"];
    [goodsQuery includeKey:@"address"];
    [goodsQuery includeKey:@"crowd"];
    [goodsQuery includeKey:@"blongUser"];
    [goodsQuery includeKey:@"categroy"];
    [goodsQuery orderByDescending:@"updatedAt"];
    [goodsQuery whereKey:@"status" equalTo:@(GoodStatusNormal)];
    
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
