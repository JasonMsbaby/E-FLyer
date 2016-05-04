//
//  BarListCell.m
//  E-flyer
//
//  Created by 张杰 on 16/5/3.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "UIImageView+EFImageView.h"
#import "BarListCell.h"

@interface BarListCell ()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *address;

@end

@implementation BarListCell


- (void)setModel:(EFUser *)model{
    if (_model != model) {
        _model = nil;
        _model = model;
        [self loadModel];
    }
}

- (void)loadModel{
    [self.img imagedWithAVFile:self.model.barImg];
    [self.img setCornerRadius:10];
    if ([self.model.barAddress isEqualToString:@""]) {
        self.address.text = @"暂无位置信息";
    }else{
        self.address.text = self.model.barAddress;
    }
    
}

@end
