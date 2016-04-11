//
//  resultUITextFiled.m
//  House_Project
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "resultUITextFiled.h"

@implementation resultUITextFiled
- (void)dealloc
{
    [_optionLabel release];
    [_unitLabel release];
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame andTaxTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //UILabel
        self.enabled = NO;
        //属性设置
        self.adjustsFontSizeToFitWidth = YES;
        self.clearButtonMode = UITextFieldViewModeUnlessEditing;
        self.borderStyle = UITextBorderStyleRoundedRect;
        self.textAlignment = NSTextAlignmentCenter;
        self.clearsOnBeginEditing = YES;
       
        UILabel *optionLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, self.bounds.size.width*2/3, self.bounds.size.height)];
        self.optionLabel = optionLabel;
        optionLabel.font = [UIFont systemFontOfSize:13];
        optionLabel.adjustsFontSizeToFitWidth = YES;
        optionLabel.text = title;
        optionLabel.font = [UIFont systemFontOfSize:15];
        optionLabel.textAlignment = NSTextAlignmentLeft;
        //UITextField
        UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(optionLabel.bounds.size.width, self.bounds.size.height/5, self.bounds.size.width/6, self.bounds.size.height*3/5)];
        
        //UILabel
        UILabel *unitLabel = [[UILabel alloc]initWithFrame:CGRectMake(tf.bounds.size.width + self.bounds.size.width*2/3+5, 0, self.bounds.size.width/6, self.bounds.size.height)];
        self.unitLabel = unitLabel;
        unitLabel.font = [UIFont systemFontOfSize:13];
        unitLabel.adjustsFontSizeToFitWidth = YES;
        
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
