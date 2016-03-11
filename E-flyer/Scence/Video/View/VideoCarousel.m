//
//  VideoCarousel.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "VideoCarousel.h"
#import "Constanst.h"

@interface VideoCarousel ()<UIScrollViewDelegate>
@property(strong,nonatomic) UIScrollView *scrollView;
@property(strong,nonatomic) UIPageControl *pageControl;
@property(strong,nonatomic) NSTimer *timer;
@property(assign,nonatomic) long currentIndex;
@end


@implementation VideoCarousel


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutModel];
    }
    return self;
}

- (void)layoutModel{
    //初始化scrollView
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth*4, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    for (int i = 0; i < 4; i++) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth, self.bounds.size.height)];
        //imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lunbo%d",i]];
        imgView.backgroundColor = kRandomColor;
        [self.scrollView addSubview:imgView];
    }
    [self addSubview:self.scrollView];
    //初始化pageControl
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - 20, kScreenWidth, 20)];
    [self.pageControl addTarget:self action:@selector(pageControlDidChange:) forControlEvents:(UIControlEventValueChanged)];
    self.pageControl.numberOfPages = 4;
    [self addSubview:self.pageControl];
    //初始化定时器
    _currentIndex = 0;
    self.timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int index = scrollView.contentOffset.x/kScreenWidth;
    self.pageControl.currentPage = index;
}

- (void)pageControlDidChange:(UIPageControl *)control{
    long index = control.currentPage;
    NSLog(@"%ld",index);
    [self.scrollView setContentOffset:CGPointMake(index*kScreenWidth, 0) animated:YES];
}

- (void)timerUpdate{
    _currentIndex = self.pageControl.currentPage;
//    NSLog(@"自动跳转：%ld",_currentIndex);
    if (_currentIndex == 3) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
        _currentIndex = -1;
    }
    _currentIndex++;
    [self.scrollView setContentOffset:CGPointMake(_currentIndex*kScreenWidth, 0) animated:YES];
    
}



@end
