//
//  UITextFieldAndUILabel.m
//  House_Project
//
//  Created by lanou3g on 14-10-14.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "UITextFieldAndUILabel.h"

@implementation UITextFieldAndUILabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//自定义初始化方法
- (id)initWithFrame:(CGRect)frame andOptionTitle:(NSString *)title andUnitStr:(NSString *)unitStr
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //UILabel
        self.enabled = NO;
        UILabel *optionLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, self.bounds.size.width*2/3, self.bounds.size.height)];
        optionLabel.font = [UIFont systemFontOfSize:13];
        //optionLabel.adjustsFontSizeToFitWidth = YES;
        optionLabel.text = title;
        //UITextField
        UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(optionLabel.bounds.size.width, self.bounds.size.height/5, self.bounds.size.width/6, self.bounds.size.height*3/5)];
        //UILabel
        UILabel *unitLabel = [[UILabel alloc]initWithFrame:CGRectMake(tf.bounds.size.width + self.bounds.size.width*2/3+5, 0, self.bounds.size.width/6, self.bounds.size.height)];
        unitLabel.font = [UIFont systemFontOfSize:13];
        unitLabel.adjustsFontSizeToFitWidth = YES;
        unitLabel.text = unitStr;
        //
        [self addSubview:unitLabel];
        [self addSubview:optionLabel];
        [optionLabel release];
        [tf release];
        [unitLabel release];
       
        
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
