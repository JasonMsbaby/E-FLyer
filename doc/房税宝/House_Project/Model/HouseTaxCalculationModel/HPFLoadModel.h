//
//  HPFLoadModel.h
//  House_Project
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPFLoadModel : UIView
//婚姻状况
@property (nonatomic , copy)NSString *marriage;
//个人月缴存
@property (nonatomic, copy)NSString *personal;
//配偶月缴存
@property (nonatomic, copy)NSString *spouse;
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
//可贷款数(评估值计算)
@property (nonatomic, copy) NSString *loadMoneyOne;
//可贷款数（月缴存计算）
@property (nonatomic, copy) NSString *loadMoneyTwo;
//可贷款数(最终值)
@property (nonatomic, copy) NSString *loadMoneyLast;

//月还款(评估值计算)
@property (nonatomic, copy) NSString *monthLoadMoneyOne;
//月还款（月缴存计算）
@property (nonatomic, copy) NSString *monthLoadMoneyTwo;
//月还款最终值
@property (nonatomic, copy) NSString *monthLoadMoneyLast;


@end
