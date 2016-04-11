  //
//  BLoadHandler.m
//  House_Project
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "BLoadHandler.h"
#import "BusinessLoanModel.h"
@implementation BLoadHandler

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//处理结果，返回Model对象
+ (BusinessLoanModel *)returnBLModelWithModel:(BusinessLoanModel *)blModel
{
    //按揭成数
    blModel.percentage =[NSString stringWithFormat:@"0.%@",[blModel.percentage substringWithRange:NSMakeRange(0, 1)]] ;
    NSLog(@"计算成数：%@",blModel.percentage);
    //评估值转换成float
    float numOne = [blModel.assessValue floatValue];
    //面积转换成float
    float numTwo = [blModel.houseArea floatValue];
    //按揭成数转换成float
    float numThree = [blModel.percentage floatValue];
    //可贷款数（元）
    blModel.loadMoney = [NSString stringWithFormat:@"%.2f",numOne * numTwo *numThree];
    int numFive = [blModel.loadMoney intValue];
    NSLog(@"可贷款数（元）：%d",numFive);
    //月供款额（系数）转换成float
    float numFour = [blModel.monthMoney floatValue];
    NSLog(@"月供款额：%.2f",numFour);
    //月还款
    blModel.monthLoadMoney = [NSString stringWithFormat:@"%.2f",numFive/10000 *numFour];
    NSLog(@"月还款：%@",blModel.monthLoadMoney);
    return blModel;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
