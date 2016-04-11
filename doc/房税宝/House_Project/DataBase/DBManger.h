//
//  DBManger.h
//  HouseProject
//
//  Created by lanou3g on 14-10-8.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResultModel.h"
#import "HouseInforModel.h"
#import "BusinessLoanModel.h"
#import "HPFLoadModel.h"
#import "HPFLoadModel.h"
@interface DBManger : NSObject

#pragma mark--房税计算结果数据库操作
#pragma mark--添加数据
+ (void)insertResultWithModel:(ResultModel *)resultModel;
#pragma mark--删除数据
+ (void)deleteResultWhereIndex:(ResultModel *)resultModel;
#pragma mark--删除所有数据
+ (void)deleteAllResult;

#pragma mark--查询数据（所有计算记录）
+ (NSMutableArray *)selectAll;


#pragma mark--双方信息数据库操作
#pragma mark--添加数据
+ (void)insertInforWithModel:(HouseInforModel *)inforModel;
#pragma mark--删除数据
+ (void)deleteInforWhereIndex:(HouseInforModel *)inforModel;
#pragma mark--删除所有数据
+ (void)deleteAllInfor;

#pragma mark--查询数据（所有计算记录）
+ (NSMutableArray *)selectInforAll;

#pragma mark--商贷操作
#pragma mark--添加数据
+ (void)insertBLInforWithModel:(BusinessLoanModel *)BLModel;
#pragma mark--删除数据
+ (void)deleteBLInforWhereIndex:(BusinessLoanModel *)BLModel;
#pragma mark--删除所有数据
+ (void)deleteAllBLInfor;

#pragma mark--查询数据（所有计算记录）
+ (NSMutableArray *)selectBLInforAll;


#pragma mark--公积金贷操作
#pragma mark--添加数据
+ (void)insertHPFLInforWithModel:(HPFLoadModel *)HPFLModel;
#pragma mark--删除数据
+ (void)deleteHPFLInforWhereIndex:(HPFLoadModel *)HPFLModel;
#pragma mark--删除所有数据
+ (void)deleteAllHPFLInfor;

#pragma mark--查询数据（所有计算记录）
+ (NSMutableArray *)selectHPFLInforAll;

@end
