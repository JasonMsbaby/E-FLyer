//
//  JSONData.h
//  HouseProject
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark --json房市资讯列表解析协议
@protocol JSONDataDelagate <NSObject>
//房市资讯列表代理传值
- (void)jsonDataDidFinishLoad:(NSMutableArray *)array;
@end

#pragma mark --json房市资讯列表详情解析协议
@protocol JSONHouseInformationDataDelagate <NSObject>
//房市资讯列表详情代理传值
- (void)jsonHouseInformationDataDidFinishLoad:(NSString *)str;



@end


@interface JSONData : NSObject
//房市资讯列表代理
@property (nonatomic, assign)id<JSONDataDelagate>delegate;
//房市资讯列表详情代理
@property (nonatomic, assign)id<JSONHouseInformationDataDelagate>delegateHouseInfor;
//房市资讯列表
- (void)houseListJsonDataWithUrl:(NSString *)url;
//房市资讯列表详情
- (void)houseInforMationJsonDataWithUrl:(NSString *)url andDocid:(NSString *)docid;

@end
