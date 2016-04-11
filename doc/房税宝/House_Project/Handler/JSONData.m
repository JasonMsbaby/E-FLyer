//
//  JSONData.m
//  HouseProject
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "JSONData.h"
#import "JsonTool.h"

@implementation JSONData
//房市资讯列表数据信息
- (void)houseListJsonDataWithUrl:(NSString *)url
{
    JsonTool *json = [[JsonTool alloc]init];
    [json JsonDictionaryWithURL:url andBlock:^(id param) {
        //代理传值
        if ([_delegate respondsToSelector:@selector(jsonDataDidFinishLoad:)])
        {
            NSMutableArray * temArray = [param objectForKey:@"全国"];
            [_delegate jsonDataDidFinishLoad:temArray];
        }
        
    }];
    [json release];
}
//房市资讯列表详情
- (void)houseInforMationJsonDataWithUrl:(NSString *)url andDocid:(NSString *)docid
{
    JsonTool *json = [[JsonTool alloc]init];
    [json JsonDictionaryWithURL:url andBlock:^(id param) {
        //代理传值
        if ([_delegateHouseInfor respondsToSelector:@selector(jsonHouseInformationDataDidFinishLoad:)])
        {
            NSDictionary *dictionary = [param objectForKey:docid];
            NSString *str = [dictionary objectForKey:@"body"];
            [_delegateHouseInfor jsonHouseInformationDataDidFinishLoad:str];
        }
        
    }];
    [json release];
    
    
}
@end
