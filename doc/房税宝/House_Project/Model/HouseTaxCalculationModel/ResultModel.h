//
//  ResultModel.h
//  HouseProject
//
//  Created by lanou3g on 14-10-8.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultModel : NSObject
//当前时间
@property (nonatomic, copy)NSString *date;
//原值
@property (nonatomic, copy)NSString *cost;
//成交价
@property (nonatomic, copy)NSString *transactionPrice;
//底价
@property (nonatomic, copy)NSString *basePrice;
//契税
@property (nonatomic, copy)NSString *deedTax;
//个税
@property (nonatomic, copy)NSString *individualIncomeTax;
//营业税
@property (nonatomic, copy)NSString * businessTax;
//土地出让金
@property (nonatomic , copy)NSString *landTransferringFees;
//中介服务费
@property (nonatomic ,copy)NSString *agencyFee;
//代办过户
@property (nonatomic, copy)NSString *transferFee;
//代办交验
@property (nonatomic, copy)NSString *renderedFee;
//代办审批
@property (nonatomic, copy)NSString * approvalFee;
//贷款代办费
@property (nonatomic, copy)NSString *loanFee;
//房税总价
@property (nonatomic, copy)NSString * totalPrice;


@end
