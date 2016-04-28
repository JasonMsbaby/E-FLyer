//
//  GoodDetailCell.m
//  E-flyer
//  商品详情cell
//  Created by 张杰 on 16/4/28.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "ToolUtils.h"
#import "UIImageView+EFImageView.h"
#import "GoodDetailCell.h"
#import "EFLog.h"
#import "EFCrowd.h"
#import "GoodsListCell.h"
#import "EFGood.h"
#import "EFBMKModel.h"



@interface GoodDetailCell ()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *sum;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UILabel *answer;
@property (weak, nonatomic) IBOutlet UILabel *left;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *crowed;
@property (weak, nonatomic) IBOutlet UILabel *area;

@property (weak, nonatomic) IBOutlet UIButton *btnDestory;
@property (weak, nonatomic) IBOutlet UIButton *btnAddMoney;





@end

@implementation GoodDetailCell



- (void)setModel:(EFGood *)model{
    if (_model != model) {
        _model = nil;
        _model = model;
        [self loadModel];
    }
}


- (void)loadModel{
    [self.img imagedWithAVFile:self.model.img];
    self.price.text = [NSString stringWithFormat:@"%.2lf元",self.model.price];
    self.number.text = [NSString stringWithFormat:@"%ld份",self.model.count];
    self.sum.text = [NSString stringWithFormat:@"%.2lf元",self.model.price*self.model.count];
    self.question.text  = self.model.question;
    self.answer.text = self.model.answer;
    self.left.text = [NSString stringWithFormat:@"%ld份",self.model.count - self.model.receivedCount];
    self.title.text = self.model.title;
    self.content.text = self.model.content;
    self.crowed.text = self.model.crowd.job;
    if(self.model.address == nil){
        self.area.text = @"投放区域：全国";
    }else{
        self.area.text = [NSString stringWithFormat:@"投放区域：%@方圆【%.2lf】公里",self.model.address.address,self.model.address.scope/1000];
    }
    
    
    [GoodsListCell AddStatusImgWithStatus:self.model.status ToImageView:self.img];
    
    if (self.model.status == GoodStatusDelete) {
        
        self.btnDestory.enabled = NO;
        self.btnDestory.backgroundColor = [UIColor colorWithWhite:0.502 alpha:1.000];
        [self.btnDestory setTitle:@"已下架" forState:(UIControlStateNormal)];
        
    }else{
        
        [self.btnDestory setTitle:@"下架" forState:(UIControlStateNormal)];
        self.btnDestory.backgroundColor = [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000];
        self.btnDestory.enabled = YES;
    }
}

//商品下架  资金退回余额  并且商品的使用数量给减掉
- (IBAction)btnDestoryAction:(id)sender {
    if (self.delegate != nil) {
        [self.delegate GoodDetailCellDelegate_UnShelve:self.model];
    }
}
//商品续费
- (IBAction)btnAddMoneyAction:(id)sender {
    if (self.delegate != nil) {
        [self.delegate GoodDetailCellDelegate_Resume:self.model];
    }
}


@end
