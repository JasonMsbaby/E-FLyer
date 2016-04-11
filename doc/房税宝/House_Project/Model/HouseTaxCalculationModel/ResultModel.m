//
//  ResultModel.m
//  HouseProject
//
//  Created by lanou3g on 14-10-8.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "ResultModel.h"

@implementation ResultModel

- (void)dealloc
{
    [_date release];
    [_basePrice release];
    [_cost release];
    [_transactionPrice release];
    [_deedTax release];
    [_individualIncomeTax release];
    [_businessTax release];
    [_landTransferringFees release];
    [_agencyFee release];
    [_transferFee release];
    [_renderedFee release];
    [_approvalFee release];
    [_loanFee release];
    [_totalPrice release];
    [super dealloc];
}
@end
