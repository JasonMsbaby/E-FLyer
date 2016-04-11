//
//  resultUITextFiled.h
//  House_Project
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface resultUITextFiled : UITextField
@property (nonatomic, retain)UILabel *optionLabel;
@property (nonatomic, retain)UILabel *unitLabel;
//自定义初始化方法
- (id)initWithFrame:(CGRect)frame andTaxTitle:(NSString *)title;

@end
