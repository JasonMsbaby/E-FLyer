//
//  HPFLoadModel.m
//  House_Project
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HPFLoadModel.h"

@implementation HPFLoadModel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)dealloc
{

    [_marriage release];
    [_personal release];
    [_spouse release];
    [_date release];
    [_assessValue release];
    [_houseArea release];
    [_percentage release];
    [_year release];
    [_APR release];
    [_APRValue release];
    [_monthMoney release];
    [_monthLoadMoneyOne release];
    [_monthLoadMoneyTwo release];
    [_monthLoadMoneyLast release];
    [_loadMoneyOne release];
    [_loadMoneyTwo release];
    [_loadMoneyLast release];
    
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
