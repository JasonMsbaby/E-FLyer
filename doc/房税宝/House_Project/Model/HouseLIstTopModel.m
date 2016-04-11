//
//  HouseLIstTopModel.m
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HouseLIstTopModel.h"

@implementation HouseLIstTopModel


-(void)dealloc
{
    [_adTitle release];
    [_alias release];
    [_cid release];
    [_digest release];
    [_docid release];
    [_ename release];
    [_hasCover release];
    [_hasHead release];
    [_HasIcon release];
    [_hasImg release];
    [_imgsrc release];
    [_lmodify release];
    [_order release];
    [_priority release];
    [_ptime release];
    [_replyCount release];
    [_source release];
    [_subtitle release];
    [_template release];
    [_timeConsuming release];
    [_title release];
    [_tname release];
    [_url release];
    [_url_3w release];


    [super dealloc];
}



-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}


@end
