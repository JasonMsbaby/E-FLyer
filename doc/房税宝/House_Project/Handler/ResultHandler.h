//
//  ResultHandler.h
//  House_Project
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HouseInforModel.h"
#import "ResultModel.h"
@interface ResultHandler : NSObject
//获得数据，处理得出结果，存储在数据库中，并返回结果对象
+ (ResultModel *)returnResultWithHouseInforModel:(HouseInforModel *)inforModel;


@end
