//
//  PopView.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/14.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "Constanst.h"
#import "PopView.h"

@interface PopView ()
@property(strong,nonatomic) UIView *btmView;
@end


@implementation PopView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    self.backgroundColor = [UIColor blackColor];
    self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:0];
    
    self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    if (self.dataSource != nil) {
        self.btmView = [self.dataSource popViewWithBottomeView];
        [self addSubview:self.btmView];
        CGRect frame = self.btmView.frame;
        frame.origin.y = kScreenHeight;
        self.btmView.frame = frame;
    }else{
        NSLog(@"Please make sure popview's dataSource isn't nil !!!");
    }
}

- (void)show{
    [UIView animateWithDuration:0.5 animations:^{
        self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:0.5];
        self.btmView.transform = CGAffineTransformMakeTranslation(0, self.btmView.bounds.size.height);
    }];
}

@end
