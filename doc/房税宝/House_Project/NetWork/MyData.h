//
//  MyData.h
//  HouseProject2
//
//  Created by lanou3g on 14-10-15.
//  Copyright (c) 2014年 邢君莉. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MyDataTools;
@protocol DicPriceTrendAnalysisDelegate <NSObject>
@optional
- (void)didFinishAnalysisPriceTrenWithDic:(NSDictionary *)dic;

@end

@protocol ArrayHotAreaAnalysisDelegate <NSObject>

- (void)didFinishAnalysisHotAreaWithArray:(NSArray *)array;


@end



@interface MyData : NSObject


@property (nonatomic,assign) id <DicPriceTrendAnalysisDelegate>delegateTrend;
@property (nonatomic,assign) id <ArrayHotAreaAnalysisDelegate>delegateHotArea;



- (void)housePriceTrendDataWithUrlStr:(NSString *)urlStr WithSig:(NSString *)sig;

- (void)hotAreaDataWithUrlStr:(NSString *)urlStr WithSig:(NSString *)sig;


@end
