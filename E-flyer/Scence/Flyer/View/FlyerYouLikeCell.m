//
//  FlyerYouLikeCell.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <UIImageView+WebCache.h>
#import "ToolUtils.h"
#import "FlyerYouLikeCell.h"

@interface FlyerYouLikeCell ()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation FlyerYouLikeCell


- (void)setModel:(EFGood *)model{
    if (_model != model) {
        _model = nil;
        _model = model;
        [self layoutModel];
    }
}

- (void)layoutModel{
    [self.img sd_setImageWithURL:[NSURL URLWithString:self.model.file.url]];
    self.title.text = self.model.title;
    self.content.text = self.model.content;
    self.price.text = [NSString stringWithFormat:@"%.2lf元",self.model.price];
    self.number.text = [NSString stringWithFormat:@"%ld份",self.model.count - self.model.receivedCount];
    self.time.text = [ToolUtils StringWithDate:self.model.createdAt];
//    WeakObj(self)
//    [self.model.file getThumbnail:YES width:90/2*3 height:90 withBlock:^(UIImage *image, NSError *error) {
//        selfWeak.img.image = image;
//    }];
}

@end
