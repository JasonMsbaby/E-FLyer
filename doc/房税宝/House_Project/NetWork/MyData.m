//
//  MyData.m
//  HouseProject2
//
//  Created by lanou3g on 14-10-15.
//  Copyright (c) 2014年 邢君莉. All rights reserved.
//

#import "MyData.h"
#import "MyDataTools.h"
@implementation MyData

- (void)housePriceTrendDataWithUrlStr:(NSString *)urlStr WithSig:(NSString *)sig{

    MyDataTools * myDataTools = [[MyDataTools alloc]init];
    [myDataTools dictionaryHistoryTrendDataWithUrlStr:urlStr WithSig:sig andBlock:^(id param) {
        if (_delegateTrend&&[_delegateTrend respondsToSelector:@selector(didFinishAnalysisPriceTrenWithDic:)]) {
            [_delegateTrend didFinishAnalysisPriceTrenWithDic:param];
        }
    }];
    
}

- (void)hotAreaDataWithUrlStr:(NSString *)urlStr WithSig:(NSString *)sig
{
    MyDataTools * myDataTools = [[MyDataTools alloc]init];
    [myDataTools arrayHotAreaDataWithUrlStr:urlStr WithSig:sig andBlock:^(id param) {
        if (_delegateHotArea&&[_delegateHotArea respondsToSelector:@selector(didFinishAnalysisHotAreaWithArray:)]) {
            [_delegateHotArea didFinishAnalysisHotAreaWithArray:param];
        }
    }];

    
}

@end
