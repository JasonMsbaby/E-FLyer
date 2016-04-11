//
//  HotAreaView.h
//  House_Project
//
//  Created by lanou3g on 14-10-11.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HotAreaViewDelegate <NSObject>
//开始动画
- (void)action;

@end


@interface HotAreaView : UIView
@property (nonatomic, assign)id<HotAreaViewDelegate>delegate;
//对应region_name（城市）区域名
@property (nonatomic, retain)UILabel *region_nameLabel;
//对应region_heat（关注度）
@property (nonatomic, retain)UILabel *region_heatLabel;
//对应关注度进度条
@property (nonatomic, retain)UIProgressView *region_heatProgressView;
//对应avg_price（房价）
@property (nonatomic, retain)UILabel *avg_priceLabel;
//对应房价进度条
@property (nonatomic, retain)UIProgressView *avg_priceProgressView;
//自定义初始化
- (id)initWithFrame:(CGRect)frame andRegion_name:(NSString *)region_name andRegion_heat:(NSString *)region_heat andAvg_price:(NSString *)avg_price;
@end
