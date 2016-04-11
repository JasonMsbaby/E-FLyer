//
//  TaxRateImageView.m
//  DAY8_Test
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 liman. All rights reserved.
//

#import "TaxRateImageView.h"

@implementation TaxRateImageView
- (void)dealloc
{
    [_scrollView release];
    [_imageView release];
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIScrollView *scorllView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 420)];
        scorllView.delegate = self;
        //缩放比例
        scorllView.minimumZoomScale = 0.5;
        scorllView.maximumZoomScale = 2;
        scorllView.contentSize = CGSizeMake(320,420);
        scorllView.backgroundColor = [UIColor whiteColor];
        self.scrollView = scorllView;
        //UIImageView
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 420)];
        self.imageView = imageView;
        [scorllView addSubview:imageView];
        [imageView release];
        [self addSubview:scorllView];
        [scorllView release];
        
        
    }
    return self;
}
//指定某个UIScrollView的子视图可以被放大缩小
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [scrollView.subviews objectAtIndex:0];
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
