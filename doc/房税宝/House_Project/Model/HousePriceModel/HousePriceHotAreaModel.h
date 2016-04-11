//
//  HousePriceHotAreaModel.h
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HousePriceHotAreaModel : NSObject
//平均房价
@property (nonatomic ,copy)NSString *avg_price;
//关注度
@property (nonatomic, copy)NSString *region_heat;
//区域名
@property (nonatomic, copy)NSString *region_name;
@end
