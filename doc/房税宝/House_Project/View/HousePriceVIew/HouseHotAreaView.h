//
//  HouseHotAreaView.h
//  HouseProject2
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 邢君莉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotAreaView.h"
@interface HouseHotAreaView : UIView<HotAreaViewDelegate>

//城市列表数组
@property (nonatomic,retain)NSMutableArray * citiesArray;
//关注度数据数组
@property (nonatomic,retain)NSMutableArray * inserestLevelDataArray;
//房价数据数组
@property (nonatomic,retain)NSMutableArray * housePriceDataArray;

@property (nonatomic,retain)HotAreaView * hotAreaView;


@property (nonatomic,retain)UIButton * btn;
@property (nonatomic,retain)UIView * appendView;

- (id)initWithFrame:(CGRect)frame andHotAreaArray:(NSArray *)array;

@end
