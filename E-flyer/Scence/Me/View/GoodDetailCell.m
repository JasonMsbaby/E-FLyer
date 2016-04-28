//
//  GoodDetailCell.m
//  E-flyer
//  商品详情cell
//  Created by 张杰 on 16/4/28.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "UIImageView+EFImageView.h"
#import "GoodDetailCell.h"

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
    self.left.text = [NSString stringWithFormat:@"%ld",self.model.count - self.model.receivedCount];
    self.title.text = self.model.title;
    self.content.text = self.model.content;
    
    if (self.model.status == GoodStatusDelete) {
        UIImageView *haveDeleteImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"havaDelete"]];
        [self.img addSubview:haveDeleteImageView];
        [haveDeleteImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.equalTo(self.img);
            make.height.equalTo(@50);
            make.width.equalTo(@50);
        }];
        self.btnDestory.enabled = NO;
        self.btnDestory.backgroundColor = [UIColor colorWithWhite:0.502 alpha:1.000];
        [self.btnDestory setTitle:@"已下架" forState:(UIControlStateNormal)];
        
    }else{
        [self.btnDestory setTitle:@"下架" forState:(UIControlStateNormal)];
        self.btnDestory.backgroundColor = [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000];
        self.btnDestory.enabled = YES;
        for (UIView *v in self.img.subviews) {
            [v removeFromSuperview];
        }
    }
}


- (IBAction)btnDestoryAction:(id)sender {
}
- (IBAction)btnAddMoneyAction:(id)sender {
}


@end
