//
//  ResultHandler.m
//  House_Project
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "ResultHandler.h"
#import "DBManger.h"
@implementation ResultHandler
//获得数据，处理得出结果，存储在数据库中，并返回结果对象
+ (ResultModel *)returnResultWithHouseInforModel:(HouseInforModel *)inforModel
{
    ResultModel *result = [[ResultModel alloc]init];
    //原值
    result.cost = [NSString stringWithFormat:@"%@万",inforModel.cost];
    //成交价
    result.transactionPrice = [NSString stringWithFormat:@"%@万",inforModel.price];
    //底价
    result.basePrice = [NSString stringWithFormat:@"%@万",inforModel.basePrice];
    //底价（转换为float类型）
    float basePrice = [result.basePrice floatValue];
    //原值(转换为float类型)
    float cost = [result.cost floatValue];
     //成交价(转换为float类型)
    float price = [result.transactionPrice floatValue];
    //房屋面积(转换为float类型)
    float area = [inforModel.houseArea floatValue];
    //百分比（转换成float）
    float present = [inforModel.present floatValue];
    //贷款额（转换成float）
    float dkMoney = [inforModel.dkMoney floatValue];
    //如果底价为0 ，则按照成本价计算
    if ( basePrice == 0) {
        //契税
        if ([inforModel.buyerHouseNum isEqualToString:@"1"]) {
            //如果买房有一套住房的话再次购房就是成交价的3%
            result.deedTax = [NSString stringWithFormat:@"%.2f",price * 0.03 *10000];
        }else{
            if (area < 90) {
                //90平米以内是(成交价的1%)
                result.deedTax = [NSString stringWithFormat:@"%.2f", price *0.01 *10000];
            }else if (area >= 90 && area < 140){
                //90-140平米是成交价的1.5%
                result.deedTax = [NSString stringWithFormat:@"%.2f", price *0.015 *10000];
            }else if (area > 140){
                //140平米以上是成交价3%
                result.deedTax = [NSString stringWithFormat:@"%.2f", price *0.03 *10000];
            }
        }
        //个税  //营业税
        if ([inforModel.years isEqualToString:@"5年以下"]) {
            //个人将购买不足5年的住房对外销售的，全额征收营业税，个税
            //营业税
            result.businessTax = [NSString stringWithFormat:@"%.2f", price *0.056 *10000];
            //个税
            result.individualIncomeTax = [NSString stringWithFormat:@"%.2f", (price*10000-cost*10000-price*10000*0.1)*0.2];
        }else if ([inforModel.years isEqualToString:@"5年以上"]){
            if ([inforModel.sellerHouseNum isEqualToString:@"2"]) {
                //个税
                result.individualIncomeTax = [NSString stringWithFormat:@"%.2f", (price*10000-cost*10000-price*10000*0.1)*0.2];
            }else{
                result.individualIncomeTax = [NSString stringWithFormat:@"0"];
            }
            if (area > 140){
                //营业税 另外140平米以上的收取【成交价—原值】X5.6%（条件是：满5年以上）
                result.businessTax = [NSString stringWithFormat:@"%.2f", (price - cost)*0.056 *10000];
            }else{
                result.businessTax = [NSString stringWithFormat:@"0"];
            }
        }
        //土地出让金
        if ([inforModel.houseType isEqualToString:@"商品房"]) {
            result.landTransferringFees = [NSString stringWithFormat:@"0"];
        }else if([inforModel.houseType isEqualToString:@"优惠价住房"]){
            //优惠价住房；1110X面积X7%
            result.landTransferringFees = [NSString stringWithFormat:@"%.2f",1110 * area * 0.07];
        }else if([inforModel.houseType isEqualToString:@"成本价住房"]){
            //成本价住房：1110X面积X1%
            result.landTransferringFees = [NSString stringWithFormat:@"%.2f",1110 * area * 0.01];
        }else if([inforModel.houseType isEqualToString:@"经济适用房"]){
            //经济适用房：       成交价X10%
            result.landTransferringFees = [NSString stringWithFormat:@"%.2f",price * 10000 * 0.1];
        }else if([inforModel.houseType isEqualToString:@"经济适用房管理"]){
            //经济适用房管理 ：   成交价X3%
            result.landTransferringFees = [NSString stringWithFormat:@"%.2f",price * 10000 * 0.03];
        }

        
    }else{
        //契税
        if ([inforModel.buyerHouseNum isEqualToString:@"1"]) {
            //如果买房有一套住房的话再次购房就是底价的3%
            result.deedTax = [NSString stringWithFormat:@"%.2f",basePrice * 0.03 *10000];
        }else{
            if (area < 90) {
                //90平米以内是(底价的1%)
                result.deedTax = [NSString stringWithFormat:@"%.2f", basePrice *0.01 *10000];
            }else if (area >= 90 && area < 140){
                //90-140平米是底价的1.5%
                result.deedTax = [NSString stringWithFormat:@"%.2f", basePrice *0.015 *10000];
            }else if (area > 140){
                //140平米以上是底价3%
                result.deedTax = [NSString stringWithFormat:@"%.2f", basePrice *0.03 *10000];
            }
        }
        //个税  //营业税
        if ([inforModel.years isEqualToString:@"5年以下"]) {
            //个人将购买不足5年的住房对外销售的，全额征收营业税，个税
            //营业税
            result.businessTax = [NSString stringWithFormat:@"%.2f", basePrice *0.056 *10000];
            //个税
            result.individualIncomeTax = [NSString stringWithFormat:@"%.2f", (basePrice*10000-cost*10000-basePrice*10000*0.1)*0.2];
        }else if ([inforModel.years isEqualToString:@"5年以上"]){
            if ([inforModel.sellerHouseNum isEqualToString:@"2"]) {
                //个税
                result.individualIncomeTax = [NSString stringWithFormat:@"%.2f", (basePrice*10000-cost*10000-basePrice*10000*0.1)*0.2];
            }else{
                result.individualIncomeTax = [NSString stringWithFormat:@"0"];
            }
            if (area > 140){
                //营业税 另外140平米以上的收取【底价—原值】X5.6%（条件是：满5年以上）
                result.businessTax = [NSString stringWithFormat:@"%.2f", (basePrice - cost)*0.056 *10000];
            }else{
                result.businessTax = [NSString stringWithFormat:@"0"];
            }
        }
        //土地出让金
        if ([inforModel.houseType isEqualToString:@"商品房"]) {
            result.landTransferringFees = [NSString stringWithFormat:@"0"];
        }else if([inforModel.houseType isEqualToString:@"优惠价住房"]){
            //优惠价住房；1110X面积X7%
            result.landTransferringFees = [NSString stringWithFormat:@"%.2f",1110 * area * 0.07];
        }else if([inforModel.houseType isEqualToString:@"成本价住房"]){
            //成本价住房：1110X面积X1%
            result.landTransferringFees = [NSString stringWithFormat:@"%.2f",1110 * area * 0.01];
        }else if([inforModel.houseType isEqualToString:@"经济适用房"]){
            //经济适用房：       底价X10%
            result.landTransferringFees = [NSString stringWithFormat:@"%.2f",basePrice * 10000 * 0.1];
        }else if([inforModel.houseType isEqualToString:@"经济适用房管理"]){
            //经济适用房管理 ：   底价X3%
            result.landTransferringFees = [NSString stringWithFormat:@"%.2f",basePrice * 10000 * 0.03];
        }

    }
    
    //中介服务费
    //成交价X百分比
    result.agencyFee = [NSString stringWithFormat:@"%.2f",price * 10000* present / 100];
    
    //代办过户//代办交验//代办审批
    if([inforModel.houseType isEqualToString:@"优惠价住房"] || [inforModel.houseType isEqualToString:@"成本价住房"]){
        result.transferFee = [NSString stringWithFormat:@"500"];
        result.renderedFee = [NSString stringWithFormat:@"200"];
        result.approvalFee = [NSString stringWithFormat:@"600"];
    }else{
        result.transferFee = [NSString stringWithFormat:@"500"];
        result.renderedFee = [NSString stringWithFormat:@"200"];
        result.approvalFee = [NSString stringWithFormat:@"0"];
    }
    //贷款代办费
    if ([inforModel.dkType isEqualToString:@"商贷"]) {
        //我们公司执行商贷贷款4800元/笔
        result.loanFee = [NSString stringWithFormat:@"4800"];
    }else if([inforModel.dkType isEqualToString:@"公积金贷款"]){
        //  公积金贷款3300元+（贷款额-20万)X50元
        result.loanFee = [NSString stringWithFormat:@"%.2f", 3300 +(dkMoney - 20)*50];
    }else{
        result.loanFee = [NSString stringWithFormat:@"0"];
    }

    //房税总价
    result.totalPrice = [NSString stringWithFormat:@"%.2f",[result.transactionPrice floatValue] + [result.deedTax floatValue] +[result.individualIncomeTax floatValue] +[result.businessTax floatValue]+[result.landTransferringFees floatValue] + [result.agencyFee floatValue] + [result.transferFee floatValue] + [result.renderedFee floatValue] +[result.approvalFee floatValue]+ [result.loanFee floatValue]];
    result.date = inforModel.date;
    //插入一条语句
    [DBManger insertResultWithModel:result];
    //返回计算数据
    return [result autorelease];
}
@end
