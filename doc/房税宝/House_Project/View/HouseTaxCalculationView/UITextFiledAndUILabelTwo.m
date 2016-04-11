//
//  UITextFiledAndUILabelTwo.m
//  House_Project
//
//  Created by lanou3g on 14-10-14.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "UITextFiledAndUILabelTwo.h"

@implementation UITextFiledAndUILabelTwo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//自定义初始化方法
- (id)initWithFrame:(CGRect)frame andOptionTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.enabled = NO;
        UILabel *optionLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, self.bounds.size.width*2/3, self.bounds.size.height)];
        optionLabel.font = [UIFont systemFontOfSize:15];
        self.label = optionLabel;
        optionLabel.adjustsFontSizeToFitWidth = YES;
        optionLabel.text = title;
        [self addSubview:optionLabel];
        [optionLabel release];
       
        
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
