//
//  HousePriceHotAreaModel.m
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HousePriceHotAreaModel.h"

@implementation HousePriceHotAreaModel
-(void)dealloc
{
    [_avg_price release];
    [_region_heat release];
    [_region_name release];


    [super dealloc];
}



@end
