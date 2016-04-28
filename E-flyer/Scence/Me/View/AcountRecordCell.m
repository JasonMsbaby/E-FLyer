//
//  AcountRecordCell.m
//  E-flyer
//  账单记录cell
//  Created by 苗爽 on 16/4/23.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "UIImageView+EFImageView.h"
#import "AcountRecordCell.h"
#import "ToolUtils.h"
#import "EFUser.h"
#import "EFGood.h"
@interface AcountRecordCell ()
@property (weak, nonatomic) IBOutlet UIImageView *acountImg;
@property (weak, nonatomic) IBOutlet UILabel *acountName;
@property (weak, nonatomic) IBOutlet UILabel *acountTime;
@property (weak, nonatomic) IBOutlet UILabel *acountMoney;
@property (weak, nonatomic) IBOutlet UILabel *acountSource;

@end

@implementation AcountRecordCell


- (void)setModel:(EFLog *)model{
    if (_model != model) {
        _model = nil;
        _model = model;
        [self loadModel];
    }
}
- (void)loadModel{
    switch (self.model.type) {
        case EFLogTypeIn:
        {
            self.acountImg.image = [[UIImage imageNamed:@"log_in"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
            self.acountName.text = @"充值";
            self.acountMoney.textColor = [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000];
            self.acountMoney.text = [NSString stringWithFormat:@"+%.2lf元",self.model.money];
        }
            break;
        case EFLogTypeOut:
        {
            self.acountImg.image = [[UIImage imageNamed:@"log_out"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
            self.acountName.text = @"提现";
            self.acountMoney.textColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.251 alpha:1.000];
            self.acountMoney.text = [NSString stringWithFormat:@"-%.2lf元",self.model.money];
        }
            break;
        case EFLogTypePublish:
        {
            [self.acountImg imagedWithAVFile:self.model.good.img];
            self.acountName.text = [NSString stringWithFormat:@"发布"];
            self.acountMoney.textColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000];
            self.acountMoney.text = [NSString stringWithFormat:@"-%.2lf元",self.model.money];
        }
        case EFLogTypeBack:
        {
            [self.acountImg imagedWithAVFile:self.model.good.img];
            self.acountName.text = [NSString stringWithFormat:@"下架"];
            self.acountMoney.textColor = [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000];
            self.acountMoney.text = [NSString stringWithFormat:@"+%.2lf元",self.model.money];
        }break;
    }
    [self.acountImg setCornerRadius:10];
    self.acountSource.text = [NSString stringWithFormat:@"【%@】",self.model.source];
    self.acountTime.text = [ToolUtils dateFormatDayWithTime:self.model.createdAt];
}

@end
