//
//  HousePriceHome.h
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HousePriceHome : NSObject
//最新均价
@property (nonatomic, copy)NSString *aver_price;
//比上周涨幅、跌幅（正负表示）
@property (nonatomic, copy) NSString *change_rate;
//白天展示图片
@property (nonatomic , copy)NSString *city_day_pic;
//晚上展示图片
@property (nonatomic, copy)NSString *city_night_pic;
#pragma mark --last_12m_data数组（按月历史走势）
@property (nonatomic, copy)NSArray *last_12m_data;
//月份
@property (nonatomic, copy)NSString *month;
//价格
@property (nonatomic, copy)NSString *price;
#pragma mark --last_12w_data数组（按起止日期历史走势）
@property (nonatomic, copy)NSArray *last_12w_data;

//截止日期
@property (nonatomic ,copy)NSString *date_end;
//开始日期
@property (nonatomic, copy)NSString *date_start;
//价格
@property (nonatomic, copy)NSString *priceT;

@end
