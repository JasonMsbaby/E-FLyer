//
//  HPFLHandler.m
//  House_Project
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HPFLHandler.h"

@implementation HPFLHandler
+ (HPFLoadModel *)returnHPFLModel:(HPFLoadModel *)HPFLModel
{
    HPFLModel.percentage =[NSString stringWithFormat:@"0.%@",[HPFLModel.percentage substringWithRange:NSMakeRange(0, 1)]];
    NSLog(@"计算成数：%@",HPFLModel.percentage);
    //评估值转换成float
    float numOne = [HPFLModel.assessValue floatValue];
    //面积转换成float
    float numTwo = [HPFLModel.houseArea floatValue];
    //按揭成数
    float numThree = [HPFLModel.percentage floatValue];
    //评估值计算可贷款数
    HPFLModel.loadMoneyOne = [NSString stringWithFormat:@"%.2f",numOne * numTwo *numThree];
    int numFive = [HPFLModel.loadMoneyOne intValue];
    //月供款额(系数)转换成float
    float numFour = [HPFLModel.monthMoney floatValue];
    NSLog(@"月供款额：%.2f",numFour);
    //月还款
    HPFLModel.monthLoadMoneyOne = [NSString stringWithFormat:@"%.2f",numFive/10000 *numFour];
    NSLog(@"月还款：%@",HPFLModel.monthLoadMoneyOne);
    
    //第二种情况：月缴存
    
   
    //个人月缴存转换成float类型
    float numberOne = [HPFLModel.personal floatValue];
    //配偶月缴存
    float numberThree = [HPFLModel.spouse floatValue];
     //首先判断婚姻状况,求出可贷款数和月还款
    if ([HPFLModel.marriage isEqualToString:@"单身"]) {
        HPFLModel.spouse = @"0";
        HPFLModel.loadMoneyTwo = [NSString stringWithFormat:@"%.2f",(numberOne/0.12 - 1092)/numFour*10000];
        HPFLModel.monthLoadMoneyTwo = [NSString stringWithFormat:@"%.2f",numberOne/0.12 - 1092];
        //最后判断得出最终的
        if (numFive < ((numberOne/0.12 - 1092)/numFour*10000)) {
            HPFLModel.loadMoneyLast = HPFLModel.loadMoneyOne;
            HPFLModel.monthLoadMoneyLast = HPFLModel.monthLoadMoneyOne;
        }else{
            HPFLModel.loadMoneyLast = HPFLModel.loadMoneyTwo;
            HPFLModel.monthLoadMoneyLast = HPFLModel.monthLoadMoneyTwo;
        }

    }else if ([HPFLModel.marriage isEqualToString:@"已婚"]){
        HPFLModel.loadMoneyTwo = [NSString stringWithFormat:@"%.2f",((numberOne + numberThree)/0.12 - 2184)/numFour*10000];
        HPFLModel.monthLoadMoneyTwo = [NSString stringWithFormat:@"%.2f",(numberOne + numberThree)/0.12 - 2184];
        //最后判断得出最终的
        if (numFive < ((numberOne/0.12 - 2184)/numFour*10000)) {
            HPFLModel.loadMoneyLast = HPFLModel.loadMoneyOne;
            HPFLModel.monthLoadMoneyLast = HPFLModel.monthLoadMoneyLast;
        }else{
            HPFLModel.loadMoneyLast = HPFLModel.loadMoneyTwo;
            HPFLModel.monthLoadMoneyLast = HPFLModel.monthLoadMoneyTwo;
        }
        

    }
    
    
    return HPFLModel;
}
@end
