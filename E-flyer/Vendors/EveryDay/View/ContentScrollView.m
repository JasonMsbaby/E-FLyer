//
//  ContentScrollView.m
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//
#import <UIImageView+WebCache.h>
#import "ContentScrollView.h"
#import "ImageContentView.h"
#import "EFGood.h"
//#import "EveryDayTableViewController.h"
@interface ContentScrollView ()

@property (nonatomic ,assign ,readwrite) NSInteger currentIndex;

@end
@implementation ContentScrollView

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray index:(NSInteger)index{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.contentSize = CGSizeMake([imageArray count] * kWidth, 0);
        
        self.bounces = NO;
        
        self.pagingEnabled = YES;
        
        self.contentOffset = CGPointMake(index * kWidth, 0);
        
        for (int i = 0; i < [imageArray count]; i ++) {
            
            ImageContentView *sonView = [[ImageContentView alloc]initWithFrame:CGRectMake(i * kWidth, 0, kWidth, kHeight) Width:35 model:imageArray[i] collor:[UIColor whiteColor]];
            
            EFGood *model = [EFGood object];
            
            model = imageArray[i];
            
            [sonView.picture sd_setImageWithURL:[NSURL URLWithString:model.img.url] placeholderImage:nil];
            
            [self addSubview:sonView];;
        }
        
    }
    return self;
}


@end
