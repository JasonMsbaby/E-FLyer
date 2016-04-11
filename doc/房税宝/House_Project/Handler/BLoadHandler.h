//
//  BLoadHandler.h
//  House_Project
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessLoanModel.h"
@interface BLoadHandler : UIView
//处理结果，返回Model对象
+ (BusinessLoanModel *)returnBLModelWithModel:(BusinessLoanModel *)blModel;
@end
