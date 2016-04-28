//
//  GoodsListCell.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/17.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <UIImageView+WebCache.h>
#import "ToolUtils.h"
#import "GoodsListCell.h"

@interface GoodsListCell ()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *haveRead;
@property (weak, nonatomic) IBOutlet UILabel *createdAt;
@property (weak, nonatomic) IBOutlet UIButton *btn_detail;

@end

@implementation GoodsListCell


- (void)setModel:(EFGood *)model{
    if (_model != model) {
        _model = nil;
        _model = model;
        [self layoutModel];
    }
}

- (void)layoutModel{
    [self.img sd_setImageWithURL:[NSURL URLWithString:self.model.img.url]];
    self.title.text = self.model.title;
    self.haveRead.text = [NSString stringWithFormat:@"%ld人",self.model.receivedCount];
    self.createdAt.text = [NSString stringWithFormat:@"发布时间:%@",[ToolUtils StringWithDate:self.model.createdAt]];
    
    [GoodsListCell AddStatusImgWithStatus:self.model.status ToImageView:self.img];
}


+ (void)AddStatusImgWithStatus:(GoodStatus)status ToImageView:(UIImageView *)imageView{
    if (status == GoodStatusDelete || status == GoodStatusFinish) {
        UIImage *img = nil;
        if (status == GoodStatusFinish) {
            img = [UIImage imageNamed:@"haveFinish"];
        }else{
            img = [UIImage imageNamed:@"havaDelete"];
        }
        UIImageView *imageV = [[UIImageView alloc] initWithImage:img];
        [imageView addSubview:imageV];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(imageView);
            make.width.height.equalTo(imageView.mas_width).multipliedBy(0.6);
        }];
        
    }else{
        for (UIView *v in imageView.subviews) {
            [v removeFromSuperview];
        }
    }
}

@end
