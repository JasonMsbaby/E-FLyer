//
//  HousePriceHome.m
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HousePriceHome.h"

@implementation HousePriceHome

-(void)dealloc
{
    [_aver_price release];
    [_change_rate release];
    [_city_day_pic release];
    [_city_night_pic release];
    [_last_12m_data release];
    [_month release];
    [_price release];
    [_last_12w_data release];
    [_date_end release];
    [_date_start release];
    [_priceT release];
    [super dealloc];
    
}
@end
