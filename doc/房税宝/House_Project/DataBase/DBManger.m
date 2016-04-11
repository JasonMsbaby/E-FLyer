//
//  DBManger.m
//  HouseProject
//
//  Created by lanou3g on 14-10-8.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "DBManger.h"
#import <sqlite3.h>
#import "DataBase.h"
#import "ResultModel.h"
#import "HouseInforModel.h"

@implementation DBManger

#pragma mark--添加数据
+ (void)insertResultWithModel:(ResultModel *)resultModel
{
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备sql语句,
    NSString *sqlStr =[NSString stringWithFormat:@"insert into results(date,cost, transactionPrice,basePrice,deedTax,individualIncomeTax, businessTax,landTransferringFees,agencyFee,transferFee, renderedFee, approvalFee,loanFee, totalPrice) values('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@',%@,'%@');",resultModel.date,resultModel.cost, resultModel.transactionPrice ,resultModel.basePrice,resultModel.deedTax, resultModel.individualIncomeTax, resultModel.businessTax, resultModel.landTransferringFees, resultModel.agencyFee,resultModel.transferFee,resultModel.renderedFee,resultModel.approvalFee,resultModel.loanFee,resultModel.totalPrice] ;
    //3.执行sql语句
    char *error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"insert成功");
    }else{
        NSLog(@"insert失败");
    }

}
#pragma mark--删除数据
+ (void)deleteResultWhereIndex:(ResultModel *)resultModel
{
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备sql语句
    NSString *sqlStr =[NSString stringWithFormat:@"delete from  results where date = '%@' ;",resultModel.date] ;
    //3.执行sql语句
    char *error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"result删除成功");
    }else{
        NSLog(@"result删除失败");
    }

}
#pragma mark--删除所有数据
+ (void)deleteAllResult
{
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备sql语句
    NSString *sqlStr =[NSString stringWithFormat:@"delete from  results;"] ;
    //3.执行sql语句
    char *error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"ALL删除成功");
    }else{
        NSLog(@"ALL删除失败");
    }
}


#pragma mark--查询数据（所有计算记录）
+ (NSMutableArray *)selectAll
{
    NSMutableArray *results  = [[NSMutableArray array] retain];
    //1.打开数据库
    sqlite3 *db = [DataBase openInforDataBase];
    //2.准备SQL语句
    NSString *sqlStr = @"select * from  results";
    //3.创建跟随指针（存取值对象）
    sqlite3_stmt *stmt = nil;
    //4.判断sql语句是否正确
    int result = sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &stmt, nil);
    if (result == SQLITE_OK) {
        
        //执行语句，逐步解析
        while (sqlite3_step(stmt)== SQLITE_ROW) {
            @autoreleasepool {
                
                ResultModel *result = [[ResultModel alloc]init];
                result.date = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
                result.cost = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                result.transactionPrice = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                result.basePrice = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
                result.deedTax = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
                result.individualIncomeTax = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
                result.businessTax = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
                result.landTransferringFees = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
                result.agencyFee= [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 8)];
                result.transferFee = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 9)];
                result.renderedFee = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 10)];
                result.approvalFee= [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 11)];
                result.loanFee = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 12)];
                result.totalPrice= [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 13)];
                [results addObject:result];
                [result release];

                
                
            }
        }
        
    }
    sqlite3_finalize(stmt);
    return [results autorelease];
}


#pragma mark--双方信息数据库操作
#pragma mark--添加数据
+ (void)insertInforWithModel:(HouseInforModel *)inforModel
{
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备sql语句,
    NSString *sqlStr =[NSString stringWithFormat:@"insert into infors(date,price,cost, houseArea,sellerHouseNum,houseType,years,buyerHouseNum,dkType,present,dkMoney,basePrice) values('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@');",inforModel.date,inforModel.price,inforModel.cost,inforModel.houseArea,inforModel.sellerHouseNum,inforModel.houseType,inforModel.years,inforModel.buyerHouseNum,inforModel.dkType,inforModel.present,inforModel.dkMoney,inforModel.basePrice] ;
    //3.执行sql语句
    char *error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"insert成功");
    }else{
        NSLog(@"insert失败");
    }
}
#pragma mark--删除数据
+ (void)deleteInforWhereIndex:(HouseInforModel *)inforModel
{
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备sql语句
    NSString *sqlStr =[NSString stringWithFormat:@"delete from  infors where date = '%@' ;",inforModel.date] ;
    //3.执行sql语句
    char *error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败");
    }

}
#pragma mark--删除所有数据
+ (void)deleteAllInfor
{
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备sql语句
    NSString *sqlStr =[NSString stringWithFormat:@"delete from  infors ;"] ;
    //3.执行sql语句
    char *error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"ALLInfor删除成功");
    }else{
        NSLog(@"ALLInfor删除失败");
    }

}
#pragma mark--查询数据（所有计算记录）
+ (NSMutableArray *)selectInforAll
{    NSMutableArray *infors  = [[NSMutableArray array] retain];
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];

    //2.准备SQL语句
    NSString *sqlStr = @"select * from  infors";
    //3.创建跟随指针（存取值对象）
    sqlite3_stmt *stmt = nil;
    //4.判断sql语句是否正确
    int result = sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &stmt, nil);
    if (result == SQLITE_OK) {
        //执行语句，逐步解析
        while (sqlite3_step(stmt)== SQLITE_ROW) {
            @autoreleasepool {
                HouseInforModel *inforModel = [[HouseInforModel alloc]init];
                inforModel.date = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
                inforModel.price = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                inforModel.cost = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                inforModel.houseArea = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
                inforModel.sellerHouseNum = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
                inforModel.houseType = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
                inforModel.years = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
                inforModel.buyerHouseNum = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
                inforModel.dkType = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 8)];
                inforModel.present = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 9)];
                inforModel.dkMoney = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 10)];
                inforModel.basePrice = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 11)];
                [infors addObject:inforModel];
                [inforModel release];
            }
           
        }
        
    }
    sqlite3_finalize(stmt);
    return [infors autorelease];

    
}


#pragma mark--商贷操作
#pragma mark--添加数据
+ (void)insertBLInforWithModel:(BusinessLoanModel *)BLModel
{
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备sql语句,
    NSString *sqlStr =[NSString stringWithFormat:@"insert into BLoadInfor(date,assessValue,houseArea,percentage,year,APR,APRValue,monthMoney,loadMoney,monthLoadMoney) values('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@');",BLModel.date,BLModel.assessValue,BLModel.houseArea,BLModel.percentage,BLModel.year,BLModel.APR,BLModel.APRValue,BLModel.monthMoney,BLModel.loadMoney,BLModel.monthLoadMoney] ;
    //3.执行sql语句
    char *error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"insert成功");
    }else{
        NSLog(@"insert失败");
    }
}
#pragma mark--删除数据
+ (void)deleteBLInforWhereIndex:(BusinessLoanModel *)BLModel
{
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备sql语句
    NSString *sqlStr =[NSString stringWithFormat:@"delete from  BLoadInfor where date = '%@' ;",BLModel.date] ;
    //3.执行sql语句
    char *error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败");
    }
}
#pragma mark--删除所有数据
+ (void)deleteAllBLInfor
{
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备sql语句
    NSString *sqlStr =[NSString stringWithFormat:@"delete from  BLoadInfor;"] ;
    //3.执行sql语句
    char *error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"AllBLInfor删除成功");
    }else{
        NSLog(@"AllBLInfor删除失败");
    }

}
#pragma mark--查询数据（所有计算记录）
+ (NSMutableArray *)selectBLInforAll
{
    NSMutableArray *infors  = [[NSMutableArray array] retain];
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备SQL语句
    NSString *sqlStr = @"select * from  BLoadInfor";
    //3.创建跟随指针（存取值对象）
    sqlite3_stmt *stmt = nil;
    //4.判断sql语句是否正确
    int result = sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &stmt, nil);
    if (result == SQLITE_OK) {
        //执行语句，逐步解析
        while (sqlite3_step(stmt)== SQLITE_ROW) {
            @autoreleasepool {
                BusinessLoanModel *inforModel = [[BusinessLoanModel alloc]init];
                inforModel.date = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
                inforModel.assessValue = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                inforModel.houseArea = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                inforModel.percentage = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
                inforModel.year = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
                inforModel.APR = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
                inforModel.APRValue = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
                inforModel.monthMoney = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
                inforModel.loadMoney = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 8)];
                inforModel.monthLoadMoney = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 9)];
                [infors addObject:inforModel];
                [inforModel release];
            }
            
        }
        
    }
    sqlite3_finalize(stmt);
    return [infors autorelease];
}



#pragma mark--公积金贷操作
#pragma mark--添加数据
+ (void)insertHPFLInforWithModel:(HPFLoadModel *)HPFLModel
{
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备sql语句,
    NSString *sqlStr =[NSString stringWithFormat:@"insert into HPFLoadTable(date,marriage,personal,spouse,assessValue,houseArea,percentage,year,APR,APRValue,monthMoney,loadMoneyOne,monthLoadMoneyOne,loadMoneyTwo,monthLoadMoneyTwo,loadMoneyLast,monthLoadMoneyLast) values('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@');",HPFLModel.date,HPFLModel.marriage,HPFLModel.personal,HPFLModel.spouse,HPFLModel.assessValue,HPFLModel.houseArea,HPFLModel.percentage,HPFLModel.year,HPFLModel.APR,HPFLModel.APRValue,HPFLModel.monthMoney,HPFLModel.loadMoneyOne,HPFLModel.monthLoadMoneyOne,HPFLModel.loadMoneyTwo,HPFLModel.monthLoadMoneyTwo,HPFLModel.loadMoneyLast,HPFLModel.monthLoadMoneyLast] ;
    //3.执行sql语句
    char *error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"insert成功");
    }else{
        NSLog(@"insert失败");
    }
}
#pragma mark--删除数据
+ (void)deleteHPFLInforWhereIndex:(HPFLoadModel *)HPFLModel
{
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备sql语句
    NSString *sqlStr =[NSString stringWithFormat:@"delete from  HPFLoadTable where date = '%@' ;",HPFLModel.date] ;
    //3.执行sql语句
    char *error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败");
    }

}
#pragma mark--删除所有数据
+ (void)deleteAllHPFLInfor
{
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备sql语句
    NSString *sqlStr =[NSString stringWithFormat:@"delete from  HPFLoadTable ;"] ;
    //3.执行sql语句
    char *error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        NSLog(@"AllHPFLInfor删除成功");
    }else{
        NSLog(@"AllHPFLInfor删除失败");
    }

}
#pragma mark--查询数据（所有计算记录）
+ (NSMutableArray *)selectHPFLInforAll
{
    NSMutableArray *infors  = [[NSMutableArray array] retain];
    //1.打开数据库
    sqlite3 *db =  [DataBase openInforDataBase];
    //2.准备SQL语句
    NSString *sqlStr = @"select * from  HPFLoadTable";
    //3.创建跟随指针（存取值对象）
    sqlite3_stmt *stmt = nil;
    //4.判断sql语句是否正确
    int result = sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &stmt, nil);
    if (result == SQLITE_OK) {
        //执行语句，逐步解析
        while (sqlite3_step(stmt)== SQLITE_ROW) {
            @autoreleasepool {
                HPFLoadModel *inforModel = [[HPFLoadModel alloc]init];
                inforModel.date = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
                inforModel.marriage = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                inforModel.personal = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                inforModel.spouse = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
                inforModel.assessValue = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
                inforModel.houseArea = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
                inforModel.percentage = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
                inforModel.year = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
                inforModel.APR = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 8)];
                inforModel.APRValue = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 9)];
                inforModel.monthMoney = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 10)];
                inforModel.loadMoneyOne = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 11)];
                inforModel.monthLoadMoneyOne = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 12)];
                inforModel.loadMoneyTwo = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 13)];
                inforModel.monthLoadMoneyTwo = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 14)];
                inforModel.loadMoneyLast = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 15)];
                inforModel.monthLoadMoneyLast = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 16)];
                [infors addObject:inforModel];
                [inforModel release];
            }
            
        }
        
    }
    sqlite3_finalize(stmt);
    return [infors autorelease];

}
@end
