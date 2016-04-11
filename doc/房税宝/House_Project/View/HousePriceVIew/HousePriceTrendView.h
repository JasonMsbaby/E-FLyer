//
//  HousePriceTrendView.h
//  HouseProject2
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 邢君莉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEMSimpleLineGraphView.h"
@interface HousePriceTrendView : UIView<BEMSimpleLineGraphDelegate>

//requestTimeLabel接口
@property (nonatomic,retain) UILabel * requestTimeLabel;
//aver_priceLabel接口
@property (nonatomic,retain) UILabel * aver_priceLabel;
//change_rateLabel接口
@property (nonatomic,retain) UILabel * change_rateLabel;


//按周显示的Button
@property (nonatomic,retain)UIButton * weekButton;
//按月显示的Button
@property (nonatomic,retain)UIButton * monthButton;

//历史走势中按周显示的ScrollView
@property (nonatomic,retain)UIScrollView * historyTrendByWeekScrollView;
////历史走势中按月显示的ScrollView
@property (nonatomic,retain)UIScrollView * historyTrendByMonthScrollView;



- (id)initWithFrame:(CGRect)frame andPriceDic:(NSDictionary *)dic;


@property (nonatomic,retain) NSDictionary * dic;

//绘制曲线所需
//@property (nonatomic,retain) BEMSimpleLineGraphView * myGraph;

@property (nonatomic,retain) NSMutableArray * week_short_Array;

@property (nonatomic,retain) NSMutableArray * arrayOfValuesMonth;
@property (nonatomic,retain) NSMutableArray * arrayOfDatesMonth;

@property (nonatomic,retain) NSMutableArray * arrayOfValuesWeek;
@property (nonatomic,retain) NSMutableArray * arrayOfDatesWeek;

@property (nonatomic,retain) NSMutableArray * weekArrayOfValues;
@property (nonatomic,retain) NSMutableArray * weekArrayOfDates;


@property (nonatomic,retain) UILabel * labelValuesMonth;
@property (nonatomic,retain) UILabel * labelDatesMonth;


@property (nonatomic,retain) UILabel * labelValuesWeek;
@property (nonatomic,retain) UILabel * labelDatesWeek;


@end
