//
//  ContentView.h
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//
#import "EFGood.h"
#import <UIKit/UIKit.h>
@class CustomView;

@interface ContentView : UIView

- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(EFGood *)model collor:(UIColor *)collor;

- (void)setData:(EFGood *)model;

@end
