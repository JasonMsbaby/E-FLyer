//
//  HousePriceTrendViewController.h
//  HouseProject2
//
//  Created by lanou3g on 14-10-15.
//  Copyright (c) 2014年 邢君莉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyData.h"
#import "HousePriceTrendView.h"

@interface HousePriceTrendViewController : UIViewController<DicPriceTrendAnalysisDelegate>

@property(nonatomic,retain)UIImageView  * myimageview;
@property (nonatomic, retain)UIActivityIndicatorView *activityIndicatorView;
@end
