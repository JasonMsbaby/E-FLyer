//
//  PortraitsView.m
//  House_Project
//
//  Created by lanou3g on 14-10-15.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "PortraitsView.h"

@implementation PortraitsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//自定义初始化方法
- (id)initWithFrame:(CGRect)frame andUIImage:(UIImage *)img
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        imgView.image = img;
        [self addSubview:imgView];
        [imgView release];
    }
    return self;
    
    
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
