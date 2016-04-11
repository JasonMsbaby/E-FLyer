//
//  BusinessLoanModel.h
//  House_Project
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusinessLoanModel : UIView
//操作时间
@property (nonatomic, copy)NSString *date;
//房屋评估值
@property (nonatomic , copy)NSString *assessValue;
//房屋面积
@property (nonatomic , copy)NSString *houseArea;
//按揭成数
@property (nonatomic , copy)NSString *percentage;
//按揭年数
@property (nonatomic , copy)NSString *year;
//贷款年利率
@property (nonatomic , copy)NSString *APR;
//年利率
@property (nonatomic, copy)NSString *APRValue;
//月供款额
@property (nonatomic, copy) NSString *monthMoney;
//可贷款数
@property (nonatomic, copy) NSString *loadMoney;
//月还款
@property (nonatomic, copy) NSString *monthLoadMoney;
@end
