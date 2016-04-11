//
//  UITextFiledAndUILabelTwo.h
//  House_Project
//
//  Created by lanou3g on 14-10-14.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextFiledAndUILabelTwo : UITextField
@property (nonatomic, retain)UILabel *label;
//自定义初始化方法
- (id)initWithFrame:(CGRect)frame andOptionTitle:(NSString *)title;
@end
