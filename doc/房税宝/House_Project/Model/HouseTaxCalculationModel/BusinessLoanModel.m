//
//  BusinessLoanModel.m
//  House_Project
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "BusinessLoanModel.h"

@implementation BusinessLoanModel

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
    [_date release];
    [_assessValue release];
    [_houseArea release];
    [_percentage release];
    [_year release];
    [_APR release];
    [_APRValue release];
    [_monthMoney release];
    [_monthLoadMoney release];
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
