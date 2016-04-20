//
//  ContentView.m
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "ContentView.h"
#import "CustomView.h"

@interface ContentView ()

@end

@implementation ContentView

- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(EFGood *)model collor:(UIColor *)collor{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:(UIBlurEffectStyleLight)];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.frame = self.bounds;
        [self addSubview:effectView];

        
        

        [self setData:model];
    }
    return self;
}

- (void)setData:(EFGood *)model {
    
}


@end
