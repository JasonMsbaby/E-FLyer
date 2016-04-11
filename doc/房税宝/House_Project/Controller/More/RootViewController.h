//
//  RootViewController.h
//  DAY8_Test
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 liman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaxRateImageView;
@interface RootViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic,retain)UIScrollView *baseScorllView;
@property (nonatomic,retain)TaxRateImageView * taxView;
@end
