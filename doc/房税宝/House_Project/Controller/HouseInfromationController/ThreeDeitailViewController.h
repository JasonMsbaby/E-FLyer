//
//  ThreeDeitailViewController.h
//  House_Project
//
//  Created by lanou3g on 14-10-15.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HouseListModelTwo.h"
@interface ThreeDeitailViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic,retain)UIScrollView * scrollView;
@property(nonatomic,retain)UIPageControl * pageControl;
@property(nonatomic,retain)HouseListModelTwo * houseListModelTwo;


@end
