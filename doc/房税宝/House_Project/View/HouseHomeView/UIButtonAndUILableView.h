//
//  UIButtonAndUILableView.h
//  House_Project
//
//  Created by lanou3g on 14-10-11.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIButtonAndUILableView : UIView
//UIButton属性
@property (nonatomic , retain)UIButton *button;
//UILable属性
@property (nonatomic, retain)UILabel *label;
//自定义初始化方法（参数：图片，标题）
- (id)initWithFrame:(CGRect)frame andImageName:(NSString *)imagename andLabelName:(NSString *)labelname;
@end
