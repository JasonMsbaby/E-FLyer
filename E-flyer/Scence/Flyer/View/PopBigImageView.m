//
//  PopBigImageView.m
//  E-flyer
//
//  Created by 苗爽 on 16/4/22.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "UIView+EFView.h"
#import "PopBigImageView.h"

@interface PopBigImageView ()
@property(nonatomic,strong) UIScrollView  *scrollView;
@property(nonatomic,strong) UIImageView *imgView;
@end

@implementation PopBigImageView

- (instancetype)initWithImage:(UIImage *)img{
    if (self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)]) {
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        self.imgView.image = img;
        self.imgView.contentMode = UIViewContentModeScaleAspectFill;
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        self.scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
        [self.scrollView addSubview:self.imgView];
        self.imgView.userInteractionEnabled = YES;
        [self.imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
        [self addSubview:self.scrollView];
    }
    return self;
}

- (void)pop{
    [UIView animateWithDuration:1.5 animations:^{
       [[UIApplication sharedApplication].keyWindow addSubview:self];
    }];
}

- (void)tap{
    [self removeFromSuperview];
}
@end
