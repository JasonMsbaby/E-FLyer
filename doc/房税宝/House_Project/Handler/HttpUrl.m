//
//  HttpUrl.m
//  House_Project
//
//  Created by lanou3g on 14-10-13.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HttpUrl.h"

@implementation HttpUrl
//房市资讯列表详情URL
+ (NSString *)houseListInformationURLWith:(NSString *)docid
{
    NSString *url = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/full.html",docid];
    return url;
}
@end
