//
//  HouseListModel.m
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HouseListModel.h"

@implementation HouseListModel

-(void)dealloc
{
    [_adTitle release];
    [_digest release];
    [_docid release];
    [_imgsrc release];
    [_lmodify release];
    [_priority release];
    [_ptime release];
    [_replyCount release];
    [_source release];
    [_subtitle release];
    [_timeConsuming release];
    [_title release];
    [_url release];
    [_url_3w release];;


    [super dealloc];
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}


@end
