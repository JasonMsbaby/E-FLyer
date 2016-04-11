//
//  ScrollViewAndUIPageControlModelView.h
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ScrollViewAndUIPageControlModelView : UIView<UIScrollViewDelegate>

//UIScrollView属性
@property (nonatomic,retain)UIScrollView * scrollView;
//UIPageController属性
@property (nonatomic,retain)UIPageControl * pageControl;
@property (nonatomic, retain)UIButton *btn;
//传过来一个图片数组
- (id)initWithFrame:(CGRect)frame AndImagesArray:(NSMutableArray *)imagesArray;
@end
