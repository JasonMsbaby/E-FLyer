//
//  HotAreaView.m
//  House_Project
//
//  Created by lanou3g on 14-10-11.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HotAreaView.h"

@implementation HotAreaView

- (void)dealloc
{

    [_region_nameLabel release];
    [_region_heatLabel release];
    [_region_heatProgressView release];
    [_avg_priceLabel release];
    [_avg_priceProgressView release];
    [super dealloc];
}




//初始化

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)   { 
        // Initialization code
 }
    return self;
}
 
//自定义初始化（参数设置：）
- (id)initWithFrame:(CGRect)frame andRegion_name:(NSString *)region_name andRegion_heat:(NSString *)region_heat andAvg_price:(NSString *)avg_price
{
    self = [super initWithFrame:frame];
    if (self)   {
        // Initialization code
        
        //self.backgroundColor = [UIColor lightGrayColor];
        
        //城市
        UILabel *region_nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 50, 20)];
        //region_nameLabel.adjustsFontSizeToFitWidth = YES;
        region_nameLabel.font = [UIFont systemFontOfSize:14];
        self.region_nameLabel = region_nameLabel;
        region_nameLabel.text = region_name;
        
        
        //关注度（x+Width = 指定值）
        UILabel *region_heatLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 5,40 , 20)];
        self.region_heatLabel = region_heatLabel;
        NSString *str = @"%";
        region_heatLabel.text = [NSString stringWithFormat:@"%@%@",region_heat,str];
        region_heatLabel.textColor = [UIColor whiteColor] ;
        //字体居右显示
        region_heatLabel.textAlignment = NSTextAlignmentRight;
        //设置字体大小适应label宽度
        //region_heatLabel.adjustsFontSizeToFitWidth = YES;
        region_heatLabel.font = [UIFont systemFontOfSize:10];
        
        
        //关注度进度条(设定一个总值，宽度是获取的数值，x是通过指定的值-获取的宽度)
        CGFloat num = [region_heat floatValue]*3;
        UIProgressView *region_heatProgressView = [[UIProgressView alloc]initWithFrame:CGRectMake(160-num, 15,num,0)];
        region_heatProgressView.progressViewStyle = UIProgressViewStyleBar;
        region_heatProgressView.transform = CGAffineTransformMakeScale(1.0f,6.0f);
        //方向逆转
        region_heatProgressView.transform = CGAffineTransformRotate(region_heatProgressView.transform, M_PI);
        self.region_heatProgressView = region_heatProgressView;
        region_heatProgressView.tintColor = [UIColor colorWithRed:245/255.0 green:166/255.0 blue:35/255.0 alpha:1];
        region_heatProgressView.backgroundColor = [UIColor clearColor];
        [region_heatProgressView setProgress:0 animated:YES];
        
        
        //房价（x+Width = 指定值）
        UILabel *avg_priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(165, 5,40 , 20)];
        self.avg_priceLabel = avg_priceLabel;
        
        float avg = [avg_price floatValue];
        avg_priceLabel.text = [NSString stringWithFormat:@"%.1f万",avg/10000];
        avg_priceLabel.textColor = [UIColor whiteColor];
        //字体居左显示
        avg_priceLabel.textAlignment = NSTextAlignmentLeft;
        //设置字体大小适应label宽度
        //avg_priceLabel.adjustsFontSizeToFitWidth = YES;
        avg_priceLabel.font = [UIFont systemFontOfSize:10];
        
        //房价进度条
        CGFloat num1 = [avg_price floatValue]/1000;
        UIProgressView *avg_priceProgressView = [[UIProgressView alloc]initWithFrame:CGRectMake(165, 15,num1,0)];
        avg_priceProgressView.progressViewStyle = UIProgressViewStyleBar;
        avg_priceProgressView.transform = CGAffineTransformMakeScale(1.0f,6.0f);
        self.avg_priceProgressView = avg_priceProgressView;
        avg_priceProgressView.tintColor = [UIColor colorWithRed:216/255.0 green:69/155.0 blue:69/255.0 alpha:1];
        avg_priceProgressView.backgroundColor = [UIColor clearColor];
        [avg_priceProgressView setProgress:0 animated:YES];
        
        
    
        //注意视图的添加顺序（否则会掩盖不显示）
        [self addSubview:avg_priceProgressView];
        [self addSubview:avg_priceLabel];
        [self addSubview:region_heatProgressView];
        [self addSubview:region_heatLabel];
        [self addSubview:region_nameLabel];
        [avg_priceLabel release];
        [avg_priceProgressView release];
        [region_nameLabel release];
        [region_heatLabel release];
        [region_heatProgressView release];
        
    }
    return self;
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
