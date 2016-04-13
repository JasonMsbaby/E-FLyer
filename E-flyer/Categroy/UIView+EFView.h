//
//  UIView+EFView.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EFView)

@property(assign,nonatomic) CGFloat x;
@property(assign,nonatomic) CGFloat y;
@property(assign,nonatomic) CGFloat width;
@property(assign,nonatomic) CGFloat height;


@property (nonatomic, assign) IBInspectable IB_DESIGNABLE CGFloat cornerRadius;

@end
