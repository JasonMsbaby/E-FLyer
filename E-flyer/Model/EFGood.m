//
//  EFGood.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/10.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "EFGood.h"

@implementation EFGood
@dynamic title;//标题
@dynamic content;//内容
@dynamic file;//图片或者视频
@dynamic categroy;//类别
@dynamic question;//问题
@dynamic answer;//答案
@dynamic price;//价格
@dynamic count;//数量
@dynamic receivedCount;//已领取数量
@dynamic blongUser;//所属用
@dynamic crowd;//针对人群
@dynamic city;//针对城市
@dynamic enable;//是否上架
@dynamic recommend;//是否推荐

+ (void)load{
    [super load];
    [self registerSubclass];
}
@end
