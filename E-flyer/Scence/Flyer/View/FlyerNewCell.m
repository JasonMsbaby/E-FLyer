//
//  FlyerYouLikeCell.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "UIView+EFView.h"
#import "UIImageView+EFImageView.h"
#import <UIImageView+WebCache.h>
#import "ToolUtils.h"
#import "PopBigImageView.h"
#import "EFUser.h"
#import "FlyerNewCell.h"

@interface FlyerNewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UITextField *answer;
@property (weak, nonatomic) IBOutlet UIButton *btnAnswer;

@end

@implementation FlyerNewCell



- (void)setModel:(EFGood *)model{
    if (_model != model) {
        _model = nil;
        _model = model;
        [self layoutModel];
    }
}

- (void)layoutModel{
    [self.img imagedWithAVFile:self.model.img];
    [self.headImg imagedWithAVFile:self.model.blongUser.barImg];
    [_headImg setCornerRadius:self.headImg.width/2];
    self.title.text = self.model.title;
    self.content.text = self.model.content;
    self.price.text = [NSString stringWithFormat:@"%.2lf元",self.model.price];
    self.number.text = [NSString stringWithFormat:@"%ld份",self.model.count - self.model.receivedCount];
    self.time.text = [ToolUtils StringWithDate:self.model.createdAt];
    self.userName.text = self.model.blongUser.barName;
    self.question.text = self.model.question;
//    NSLog(@"%@",self.model.question);
    [self.btnAnswer addTarget:self action:@selector(btnAnswerAction) forControlEvents:(UIControlEventTouchUpInside)];
    self.img.userInteractionEnabled = YES;
    [self.img addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
    if ([self.model.question isEqualToString:@""]) {
        self.answer.enabled = NO;
        self.answer.placeholder = @"木有问题，领取奖励即可😊";
    }else{
        self.answer.placeholder = @"请输入问题答案🔑";
        self.answer.enabled = YES;
    }
    //    WeakObj(self)
    //    [self.model.file getThumbnail:YES width:90/2*3 height:90 withBlock:^(UIImage *image, NSError *error) {
    //        selfWeak.img.image = image;
    //    }];
}

- (void)tap{
    PopBigImageView *popView = [[PopBigImageView alloc]initWithImage:self.img.image];
    [popView pop];
}

- (void)btnAnswerAction{
    if (self.block != nil) {
        self.block(self.model,self.answer.text);
    }
}

@end
