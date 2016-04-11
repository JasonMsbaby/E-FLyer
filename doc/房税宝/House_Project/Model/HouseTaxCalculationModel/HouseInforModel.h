//
//  HouseInforModel.h
//  House_Project
//
//  Created by lanou3g on 14-10-14.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HouseInforModel : NSObject

#pragma mark -- 卖方信息
//当前时间
@property (nonatomic, copy)NSString *date;
//卖方住房套数
@property (nonatomic, copy)NSString *sellerHouseNum;
//所售住房类型
@property (nonatomic, copy)NSString *houseType;
//所售住房面积
@property (nonatomic, copy)NSString *houseArea;
//所售住房购买年限
@property (nonatomic, copy)NSString *years;
//成交价
@property (nonatomic, copy)NSString *price;
//底价
@property (nonatomic, copy)NSString *basePrice;
//原值
@property (nonatomic, copy)NSString *cost;

#pragma mark -- 买方信息
//买方住房套数
@property (nonatomic, copy)NSString *buyerHouseNum;
//贷款类型
@property (nonatomic, copy)NSString *dkType;
//贷款金额
@property (nonatomic, copy)NSString *dkMoney;
//中介服务费百分比
@property (nonatomic, copy)NSString *present;

@end
