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

@interface AcountRecordCell ()
@property (weak, nonatomic) IBOutlet UIImageView *acountImg;
@property (weak, nonatomic) IBOutlet UILabel *acountName;
@property (weak, nonatomic) IBOutlet UILabel *acountTime;
@property (weak, nonatomic) IBOutlet UILabel *acountMoney;

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
            self.acountImg.image = [UIImage imageNamed:@"log_in"];
            self.acountName.text = @"充值";
            self.acountMoney.textColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.251 alpha:1.000];
        }
            break;
        case EFLogTypeOut:
        {
            self.acountImg.image = [UIImage imageNamed:@"log_out"];
            self.acountName.text = @"提现";
            self.acountMoney.textColor = [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000];
        }
            break;
        case EFLogTypePublish:
        {
            [self.acountImg imagedWithAVFile:self.model.good.img];
            self.acountName.text = [NSString stringWithFormat:@"发布:%@",self.model.good.title];
            self.acountMoney.textColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000];
        }
    }
    self.acountTime.text = [ToolUtils dateFormatDayWithTime:self.model.createdAt];
}

@end
