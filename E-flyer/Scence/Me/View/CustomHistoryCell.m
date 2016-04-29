//
//  CustomHistoryCell.m
//  E-flyer
//  用户浏览记录cell
//  Created by 张杰 on 16/4/29.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "UIImageView+EFImageView.h"
#import "EFReciveOrder.h"
#import "CustomHistoryCell.h"
#import "ToolUtils.h"
#import <UIButton+WebCache.h>

@interface CustomHistoryCell ()
@property (weak, nonatomic) IBOutlet UIButton *goodImg;
@property (weak, nonatomic) IBOutlet UIButton *barImg;
@property (weak, nonatomic) IBOutlet UILabel *barTitle;
@property (weak, nonatomic) IBOutlet UILabel *goodTitle;
@property (weak, nonatomic) IBOutlet UILabel *goodPrice;
@property (weak, nonatomic) IBOutlet UILabel *receiveTime;

@end

@implementation CustomHistoryCell


- (void)setModel:(EFReciveOrder *)model{
    if (_model != model) {
        _model = nil;
        _model = model;
        [self loadModel];
    }
}

- (void)loadModel{
    UIImage *goodimg = [UIImage imageWithData:[self.model.good.img getData]];
    UIImage *barimg = [UIImage imageWithData:[self.model.good.blongUser.barImg getData]];
    [self.goodImg setBackgroundImage:goodimg forState:(UIControlStateNormal)];
    [self.barImg setBackgroundImage:barimg forState:(UIControlStateNormal)];
    
    self.barImg.layer.cornerRadius = self.barImg.bounds.size.width/2;
    self.barImg.clipsToBounds = YES;
    
    self.barTitle.text = self.model.good.blongUser.barName;
    self.goodTitle.text = self.model.good.title;
    self.goodPrice.text = [NSString stringWithFormat:@"单价：%.2lf元",self.model.good.price];
    self.receiveTime.text = [ToolUtils StringWithDate:self.model.createdAt];
}

@end
