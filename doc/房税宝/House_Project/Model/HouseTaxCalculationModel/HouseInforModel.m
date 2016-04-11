//
//  HouseInforModel.m
//  House_Project
//
//  Created by lanou3g on 14-10-14.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HouseInforModel.h"

@implementation HouseInforModel
- (void)dealloc
{
    [_date release];
    [_sellerHouseNum release];
    [_houseType release];
    [_houseArea release];
    [_years release];
    [_price release];
    [_buyerHouseNum release];
    [_dkType release];
    [_present release];
    [_dkMoney release];
    [_cost release];
    [_basePrice release];
    [super dealloc];
}
@end
