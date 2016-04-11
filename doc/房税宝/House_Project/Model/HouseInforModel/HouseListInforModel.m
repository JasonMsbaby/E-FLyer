//
//  HouseListInforModel.m
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HouseListInforModel.h"

@implementation HouseListInforModel

-(void)dealloc
{
    [_body release];
    [_digest release];
    [_ptime release];
    [_source release];
    [_title release];

    
    
    [super dealloc];
}


@end
