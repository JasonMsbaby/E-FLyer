//
//  HousePriceTrendView.m
//  HouseProject2
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 邢君莉. All rights reserved.
//

#import "HousePriceTrendView.h"
#import "HouseHeader.h"
#import "UIImageView+WebCache.h"

int totalNumberMonth,totalNumberWeek;

@implementation HousePriceTrendView

-(void)dealloc
{

    [_requestTimeLabel release];
    [_aver_priceLabel release];
    [_change_rateLabel release];
    
    
    [_historyTrendByWeekScrollView release];
    [_historyTrendByMonthScrollView release];
    [_monthButton release];
    [_weekButton release];
    [_dic release];
    
    [_week_short_Array release];
    
    [_arrayOfValuesMonth release];
    [_arrayOfDatesMonth release];
    
    [_arrayOfValuesWeek release];
    [_arrayOfDatesWeek release];
    
    [_weekArrayOfValues release];
    [_weekArrayOfDates release];
    
    [_labelValuesMonth release];
    [_labelDatesMonth release];
    
    [_labelValuesWeek release];
    
    [_labelDatesWeek release];
    
    

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


- (id)initWithFrame:(CGRect)frame andPriceDic:(NSDictionary *)dic
{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.dic = dic;
        //显示图片的ImageView
        UIImageView * topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, (ScreenHeight-84)/2-30)];
               [self addSubview:topImageView];

        
        //根据时间确定topImageView显示白天，夜晚的图片
        
//        NSDate * date6 = [self getCustomDateWithHour:6];
//        NSDate * date18 = [self getCustomDateWithHour:18];
//        NSDate * currentDate = [NSDate date];
//        if ([currentDate compare:date6] == NSOrderedDescending &&[currentDate compare:date18] == NSOrderedAscending)
//        {//如果获取的系统时间是6:00--18:00则显示白天图片
//            [topImageView setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"city_day_pic"]]];
//        }else
//        {
        //否则当系统时间在18:00--6:00,则显示夜晚图片
        [topImageView setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"city_night_pic"]] placeholderImage:[UIImage imageNamed:@"housePriceBackgroundImage.jpg"]];
        //[topImageView setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"city_night_pic"]]];
       
        
        
        //显示"最新均价"的Label
        UILabel * aver_priceSignLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/32, (ScreenHeight-84)/2-80, 100, 20)];
        [topImageView addSubview:aver_priceSignLabel];
        aver_priceSignLabel.text = @"最新均价(元/平)";
        aver_priceSignLabel.textColor = [UIColor whiteColor];
        aver_priceSignLabel.font = [UIFont systemFontOfSize:12];
        [aver_priceSignLabel release];
        
        //显示"最新均价数据 "的Label
        UILabel * aver_priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/32, (ScreenHeight-84)/2-60, 100, 35)];
        [topImageView addSubview:aver_priceLabel];
        self.aver_priceLabel = aver_priceLabel;
        
        aver_priceLabel.text = [dic objectForKey:@"aver_price"];
        aver_priceLabel.font = [UIFont systemFontOfSize:20];
        aver_priceLabel.textColor = [UIColor whiteColor];
        [aver_priceLabel release];
        
        //显示"比上周 "的Label
        UILabel * change_rateSignLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/2-40, (ScreenHeight-84)/2-80, 80, 20)];
        [topImageView addSubview:change_rateSignLabel];
        change_rateSignLabel.text = @"比上周";
        change_rateSignLabel.textColor = [UIColor whiteColor];
        change_rateSignLabel.font = [UIFont systemFontOfSize:12];
        [change_rateSignLabel release];
        UILabel * change_rateLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/2-40, (ScreenHeight-84)/2-60, 80, 35  )];
        [topImageView addSubview:change_rateLabel];
        self.change_rateLabel = change_rateLabel;
        change_rateLabel.text = [NSString stringWithFormat:@"%@%%",[dic objectForKey:@"change_rate"]];
        change_rateLabel.textColor = [UIColor whiteColor];
        change_rateLabel.font = [UIFont systemFontOfSize:20];
        [change_rateLabel release];
        
        //显示"更新于。。  "的Label
        UILabel * requestTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/2+40, (ScreenHeight-84)/2-50, 120, 20)];
        [topImageView addSubview:requestTimeLabel];
        //self.requestTimeLabel=requestTimeLabel;
        
        //获取系统的时间再截取
        NSDate * nowDate = [NSDate date];
        NSString * time = [NSString stringWithFormat:@"%@",nowDate ];
        NSString * time2 = [time substringToIndex:10];
        requestTimeLabel.text = [NSString stringWithFormat:@"更新于%@",time2];
        requestTimeLabel.textColor = [UIColor whiteColor];
        requestTimeLabel.font = [UIFont systemFontOfSize:12];
        [requestTimeLabel release];
        
        
        topImageView.backgroundColor = [UIColor blueColor];
        topImageView.alpha = 1;
        [topImageView release];
        
        
        //显示"历史走势"的Label
        UILabel * historyTrendLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/32, (ScreenHeight-84)/2-30, 80, 30)];
        [self addSubview:historyTrendLabel];
        historyTrendLabel.text = @"历史走势";
        historyTrendLabel.font = [UIFont systemFontOfSize:15];
        historyTrendLabel.textColor = [UIColor grayColor];
        [historyTrendLabel release];
        
        //按周显示的Button
        UIButton * weekButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [weekButton setTitle:@"周" forState:UIControlStateNormal];
        weekButton.titleLabel.font = [UIFont systemFontOfSize:14];
        weekButton.frame = CGRectMake(ScreenWidth-105, (ScreenHeight-84)/2-35, 45, 45);
        [weekButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [weekButton addTarget:self action:@selector(displayByWeek:) forControlEvents:UIControlEventTouchUpInside];
        self.weekButton = weekButton;
        [self addSubview:weekButton];
        
        //周与月之间的竖线
        UIView * verticalLineView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth-57.5, (ScreenHeight-84)/2-25 , 0.5, 20)];
        [self addSubview:verticalLineView];
        verticalLineView.backgroundColor = [UIColor grayColor];
        [verticalLineView release];
        
        
        //按月显示的Button
        UIButton * monthButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [monthButton setTitle:@"月" forState:UIControlStateNormal];
        monthButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [monthButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        monthButton.frame = CGRectMake(ScreenWidth-55, (ScreenHeight-84)/2-35, 45,45);
        [monthButton addTarget:self action:@selector(displayByMonth:) forControlEvents:UIControlEventTouchUpInside];
        self.monthButton = monthButton;
        [self addSubview:monthButton];
    
        
        
        
        //走势图Label
        UIScrollView * historyTrendByMonthScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, (ScreenHeight-84)/2, ScreenWidth, (ScreenHeight-84)/2-40 )];
        [self addSubview:historyTrendByMonthScrollView];
        historyTrendByMonthScrollView.contentSize = CGSizeMake(ScreenWidth*2, (ScreenHeight-84)/2-40);
        self.historyTrendByMonthScrollView=historyTrendByMonthScrollView;
        
        [UIView animateWithDuration:4 animations:^{
        historyTrendByMonthScrollView.contentOffset=CGPointMake(ScreenWidth, 0);
        }];
        
        
        //获取last_12m_data数据
        NSMutableArray * monthArray = [[[NSMutableArray alloc]init]autorelease];
        NSMutableArray * priceArray = [[[NSMutableArray alloc]init]autorelease];
        
        NSArray * array = [dic objectForKey:@"last_12m_data"];
        for (NSDictionary * temDic in array) {
            [monthArray addObject:[temDic objectForKey:@"month"]];
            [priceArray addObject:[temDic objectForKey:@"price"]];
        }
        
        
        self.arrayOfValuesMonth = [[[NSMutableArray alloc] init]autorelease];
        self.arrayOfDatesMonth = [[[NSMutableArray alloc] init]autorelease];
        
        
        totalNumberMonth = 0;
        self.arrayOfValuesMonth = priceArray;
        self.arrayOfDatesMonth = monthArray;
        for (int i=0; i<monthArray.count; i++) {
            totalNumberMonth = totalNumberMonth + [[self.arrayOfValuesMonth objectAtIndex:i]intValue];
            
        }
        
        
        
         BEMSimpleLineGraphView * myGraph = [[[BEMSimpleLineGraphView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth*2, (ScreenHeight-84)/2-40)]autorelease];
        myGraph.delegate = self;
        //self.myGraph.backgroundColor = [UIColor orangeColor];
        
        [historyTrendByMonthScrollView addSubview:myGraph];
        
        myGraph.enableTouchReport = YES;
        myGraph.colorTop = [UIColor colorWithRed:31.0/255.0 green:187.0/255.0 blue:166.0/255.0 alpha:1.0];
        myGraph.colorBottom = [UIColor colorWithRed:31.0/255.0 green:187.0/255.0 blue:166.0/255.0 alpha:1.0]; // Leaving this not-set on iOS 7 will default to your window's tintColor
        myGraph.colorLine = [UIColor whiteColor];
        myGraph.colorXaxisLabel = [UIColor whiteColor];
        myGraph.widthLine = 3.0;
        myGraph.enableTouchReport = YES;
        
        // The labels to report the values of the graph when the user touches it
        self.labelValuesMonth = [[[UILabel alloc]initWithFrame:CGRectMake(0, ScreenHeight-124, ScreenWidth, 20)]autorelease];
        self.labelValuesMonth.textColor = [UIColor colorWithRed:50/255.0 green:173/255.0 blue:148/255.0 alpha:1];
        self.labelValuesMonth.text = [NSString stringWithFormat:@"%u元", totalNumberMonth/self.arrayOfValuesMonth.count];
        
        self.labelValuesMonth.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_labelValuesMonth];
        self.labelDatesMonth = [[[UILabel alloc]initWithFrame:CGRectMake(0, ScreenHeight-104, ScreenWidth, 20)]autorelease];
        self.labelDatesMonth.textColor = [UIColor colorWithRed:50/255.0 green:173/255.0 blue:148/255.0 alpha:1];
        self.labelDatesMonth.text = @"月(平均值)";
        self.labelDatesMonth.font = [UIFont systemFontOfSize:15];
        self.labelDatesMonth.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_labelDatesMonth];
        
        
        
        [historyTrendByMonthScrollView release];
      

    }
    return self;

}



- (NSDate *)getCustomDateWithHour:(NSInteger)hour
{
//获取当前时间
    NSDate * currentDate = [NSDate date];
    NSCalendar * currentCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents * currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    //设置当天的某个点
    NSDateComponents * resultComps = [[NSDateComponents alloc]init];
    [resultComps setYear:[currentComps year ]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    
    NSCalendar * resultCalender = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDate * reDate = [resultCalender dateFromComponents:resultComps];
    
   
    [currentCalendar release];
    [resultComps release];
    [resultCalender release];
    return reDate;
    
}


//按"周"显示按钮的方法
- (void)displayByWeek:(UIButton *)sender
{
    if (_labelValuesWeek && _labelDatesWeek) {
        [_labelDatesWeek setHidden:NO];
        [_labelValuesWeek setHidden:NO];
    }
    [_labelDatesMonth setHidden:YES];
    [_labelValuesMonth setHidden:YES];
    [self.historyTrendByMonthScrollView removeFromSuperview];
    
    //将historyTrendByMonthScrollView的contentOffset设为(0,0)
    _historyTrendByMonthScrollView.contentOffset = CGPointMake(0, 0);
    
    
    //设置historyTrendByMonthScrollView的contentOffset，使从向左滑动慢慢显示房价走势图
    [UIView animateWithDuration:4 animations:^{
        _historyTrendByWeekScrollView.contentOffset=CGPointMake(ScreenWidth, 0);
    }];

    
    //如果historyTrendByWeekScrollView是空，就创建,否则直接添加
    if (!_historyTrendByWeekScrollView) {
        
    //走势图Label
        
    UIScrollView * historyTrendByWeekScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, (ScreenHeight-84)/2, ScreenWidth, (ScreenHeight-84)/2-40  )];
    [self addSubview:historyTrendByWeekScrollView];
    historyTrendByWeekScrollView.contentSize = CGSizeMake(ScreenWidth*2, (ScreenHeight-84)/2-40);
    self.historyTrendByWeekScrollView=historyTrendByWeekScrollView;
    ////设置historyTrendByMonthScrollView的contentOffset，使从向左滑动慢慢显示房价走势图
        [UIView animateWithDuration:4 animations:^{
            historyTrendByWeekScrollView.contentOffset=CGPointMake(ScreenWidth, 0);
        }];
        
        
    //获取last_12w_data数据
    NSMutableArray * weekArray = [[[NSMutableArray alloc]init]autorelease];
    NSMutableArray * week_end_Array = [[[NSMutableArray alloc]init]autorelease];
    NSMutableArray * week_start_Array = [[[NSMutableArray alloc]init]autorelease];
        
    NSMutableArray * week_short_Array = [[[NSMutableArray alloc]init]autorelease];
        
        
    NSMutableArray * priceArray = [[[NSMutableArray alloc]init]autorelease];
    
    NSArray * array = [_dic objectForKey:@"last_12w_data"];
    for (NSDictionary * temDic in array) {
        [week_start_Array addObject:[temDic objectForKey:@"date_start"]];
        [week_end_Array addObject:[temDic objectForKey:@"date_end"]];
        
        
        [priceArray addObject:[temDic objectForKey:@"price"]];
    }
    
    for (int i=0; i<week_start_Array.count; i++) {
    
        NSString * week = [[week_start_Array objectAtIndex:i] stringByAppendingFormat:@"---%@",[[week_end_Array objectAtIndex:i] substringFromIndex:5] ];
            [weekArray addObject:week];
        
        
        NSString * week_short = [[[week_start_Array objectAtIndex:i]substringFromIndex:5] stringByAppendingFormat:@",%@",[[week_end_Array objectAtIndex:i]substringFromIndex:8]];
        
        [week_short_Array addObject:week_short];
     
        
        
        
    }
    
    self.week_short_Array = week_short_Array;
    self.arrayOfValuesWeek = [[[NSMutableArray alloc] init]autorelease];
    self.arrayOfDatesWeek = [[[NSMutableArray alloc] init]autorelease];
    
    
    totalNumberWeek = 0;
    self.arrayOfValuesWeek = priceArray;
    self.arrayOfDatesWeek = weekArray;
    for (int i=0; i<weekArray.count; i++) {
        totalNumberWeek = totalNumberWeek + [[self.arrayOfValuesWeek objectAtIndex:i]intValue];
        
    }
    
    
    
    BEMSimpleLineGraphView * myGraph = [[[BEMSimpleLineGraphView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth*2, (ScreenHeight-84)/2-40 )]autorelease];
    myGraph.delegate = self;
    //self.myGraph.backgroundColor = [UIColor orangeColor];
    
    [historyTrendByWeekScrollView addSubview:myGraph];
    
    myGraph.enableTouchReport = YES;
    myGraph.colorTop = [UIColor colorWithRed:31.0/255.0 green:187.0/255.0 blue:166.0/255.0 alpha:1.0];
    myGraph.colorBottom = [UIColor colorWithRed:31.0/255.0 green:187.0/255.0 blue:166.0/255.0 alpha:1.0]; // Leaving this not-set on iOS 7 will default to your window's tintColor
    myGraph.colorLine = [UIColor whiteColor];
    myGraph.colorXaxisLabel = [UIColor whiteColor];
    myGraph.widthLine = 3.0;
    myGraph.enableTouchReport = YES;
    
    // The labels to report the values of the graph when the user touches it
    self.labelValuesWeek = [[[UILabel alloc]initWithFrame:CGRectMake(0, ScreenHeight-124, ScreenWidth, 20)]autorelease];
    self.labelValuesWeek.textColor = [UIColor colorWithRed:50/255.0 green:173/255.0 blue:148/255.0 alpha:1];
    self.labelValuesWeek.text = [NSString stringWithFormat:@"%u元", totalNumberWeek/self.arrayOfValuesWeek.count];
    self.labelValuesWeek.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_labelValuesWeek];
    self.labelDatesWeek = [[[UILabel alloc]initWithFrame:CGRectMake(0, ScreenHeight-104, ScreenWidth, 20)]autorelease];
    self.labelDatesWeek.textColor = [UIColor colorWithRed:50/255.0 green:173/255.0 blue:148/255.0 alpha:1];
    self.labelDatesWeek.text = @"周(平均值)";
    self.labelDatesWeek.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_labelDatesWeek];
    
    
    [historyTrendByWeekScrollView release];
    
        
        
    }
    
    
    [self addSubview:self.historyTrendByWeekScrollView];
    //点击按"月"显示的按钮时将按"周"显示的文字变回"灰"色,将自己的Button文字变为"黑"色
    [_monthButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
}

//按"月"显示按钮的方法
- (void)displayByMonth:(UIButton *)sender
{
    [_labelDatesMonth setHidden:NO];
    [_labelValuesMonth setHidden:NO];
    [_labelDatesWeek setHidden:YES];
    [_labelValuesWeek setHidden:YES];
    //将historyTrendByWeekScrollViewr的contentOffset设为(0,0)
    _historyTrendByWeekScrollView.contentOffset = CGPointMake(0, 0);

    
    
    UIView * superView=self.historyTrendByWeekScrollView.superview;
    
    if (superView) {
        [self.historyTrendByWeekScrollView removeFromSuperview];
    }
    //设置historyTrendByMonthScrollView的contentOffset，使从向左滑动慢慢显示房价走势图
    [self addSubview:self.historyTrendByMonthScrollView];
    [UIView animateWithDuration:4 animations:^{
        _historyTrendByMonthScrollView.contentOffset=CGPointMake(ScreenWidth, 0);
    }];

    
    //点击按"周"显示的按钮时将按"月"显示的文字变回"灰"色,将自己的Button文字变为"黑"色
    [_weekButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    
    
}



#pragma mark - SimpleLineGraph Data Source

- (int)numberOfPointsInGraph {
    if ([_historyTrendByMonthScrollView superview]) {
        return (int)[self.arrayOfValuesMonth count];

    }
    return (int)[self.arrayOfValuesWeek count];
    
}

- (float)valueForIndex:(NSInteger)index {
    if ([_historyTrendByMonthScrollView superview]) {
        return [[self.arrayOfValuesMonth objectAtIndex:index] floatValue];
    }
    return [[self.arrayOfValuesWeek objectAtIndex:index]floatValue];
    
}

#pragma mark - SimpleLineGraph Delegate

- (int)numberOfGapsBetweenLabels {
    return 0;
}

- (NSString *)labelOnXAxisForIndex:(NSInteger)index {
    if ([_historyTrendByMonthScrollView superview]) {
        return [self.arrayOfDatesMonth objectAtIndex:index];

    }
    return [self.week_short_Array objectAtIndex:index];
    
}

- (void)didTouchGraphWithClosestIndex:(int)index {
    if ([_historyTrendByMonthScrollView superview]) {
        self.labelValuesMonth.text = [NSString stringWithFormat:@"%@元", [self.arrayOfValuesMonth objectAtIndex:index]];
        
        self.labelDatesMonth.text = [NSString stringWithFormat:@"%@月", [self.arrayOfDatesMonth objectAtIndex:index]];
    }
    else
    {
    
        
        self.labelValuesWeek.text = [NSString stringWithFormat:@"%@元",[self.arrayOfValuesWeek objectAtIndex:index]];
        self.labelDatesWeek.text = [NSString stringWithFormat:@"%@",[self.arrayOfDatesWeek objectAtIndex:index]];
    }
    
    
}

- (void)didReleaseGraphWithClosestIndex:(float)index {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.labelValuesMonth.alpha = 0.0;
        self.labelDatesMonth.alpha = 0.0;
        self.labelValuesWeek.alpha = 0.0;
        self.labelDatesWeek.alpha = 0.0;

    } completion:^(BOOL finished){
        
        
        if ([_historyTrendByMonthScrollView superview]) {
            self.labelValuesMonth.text = [NSString stringWithFormat:@"%u", totalNumberMonth/self.arrayOfValuesMonth.count];
            self.labelDatesMonth.text = @"月(平均值)";
        }
        else
        {
            
            
            self.labelValuesWeek.text = [NSString stringWithFormat:@"%u", totalNumberWeek/self.arrayOfValuesWeek.count];
            self.labelDatesWeek.text = @"周(平均值)";

        }

        
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.labelValuesMonth.alpha = 1.0;
            self.labelDatesMonth.alpha = 1.0;
            self.labelValuesWeek.alpha = 1.0;
            self.labelDatesWeek.alpha = 1.0;
        } completion:nil];
    }];
    
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
