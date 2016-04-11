//
//  ScrollViewAndUIPageControlModelView.m
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "ScrollViewAndUIPageControlModelView.h"

@implementation ScrollViewAndUIPageControlModelView
-(void)dealloc
{
    [_scrollView release];
    [_pageControl release];
    

    [super dealloc];
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame AndImagesArray:(NSMutableArray *)imagesArray
{
    if (self=[super init]) {
        self.frame=frame;
        //布局页面
        //创建UIScrollView对象
        UIScrollView * scrollView=[[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        self.scrollView=scrollView;
        scrollView.layer.masksToBounds =YES;
        scrollView.layer.cornerRadius =5;
        
        scrollView.pagingEnabled=YES;
        scrollView.delegate=self;
        scrollView.contentSize=CGSizeMake([[UIScreen mainScreen] bounds].size.width*imagesArray.count, [[UIScreen mainScreen] bounds].size.height);
        //for循环添加图片
        for (int i=0; i<imagesArray.count; i++) {
            UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width*i, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds ].size.height)];
            imageView.image=[imagesArray objectAtIndex:i];
            imageView.layer.masksToBounds =YES;
            imageView.layer.cornerRadius =5;
            [scrollView addSubview:imageView];
            [imageView release];
            if (i == imagesArray.count-1) {
                UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.backgroundColor = [UIColor orangeColor];
                [button setTitle:@"进去瞧瞧" forState:UIControlStateNormal];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                button.frame =CGRectMake(self.bounds.size.width-180, self.bounds.size.height-90, 60, 44);
                button.layer.cornerRadius = 5;
                self.btn = button;
                [imageView addSubview:button];
            }
        }
        //创建UIPageControl对象
        UIPageControl * pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(self.bounds.size.width-180, self.bounds.size.height-20, 60, 20)];
        pageControl.enabled=YES;
        self.pageControl=pageControl;
        pageControl.pageIndicatorTintColor = [UIColor orangeColor];
        pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
        pageControl.numberOfPages=imagesArray.count;
        [pageControl addTarget:self action:@selector(changePages:) forControlEvents:UIControlEventValueChanged];
        // 添加视图
        [self addSubview:scrollView];
        [self addSubview:pageControl];
        //释放
        [scrollView release];
        [pageControl release];
        
        
        
    }
    
    
    return self;
    
}
- (void)changePages:(UIPageControl *)page
{
    [_scrollView setContentOffset:CGPointMake([page currentPage]*self.bounds.size.width, 0) animated:YES];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int pages=scrollView.contentOffset.x/self.bounds.size.width;
    _pageControl.currentPage=pages;
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
