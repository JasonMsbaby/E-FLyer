//
//  GuideViewController.h
//  House_Project
//
//  Created by lanou3g on 14-10-24.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideViewController : UIViewController<UIScrollViewDelegate>
//UIScrollView属性
@property (nonatomic,retain)UIScrollView * scrollView;
//UIPageController属性
@property (nonatomic,retain)UIPageControl * pageControl;
@property (nonatomic,retain)UIImageView *imgView;
@end
