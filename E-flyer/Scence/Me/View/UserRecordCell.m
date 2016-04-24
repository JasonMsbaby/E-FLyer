//
//  UserRecordCell.m
//  E-flyer
//  用户领取记录的每条信息
//  Created by 苗爽 on 16/4/23.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "UserRecordCell.h"

@interface UserRecordCell ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userAddress;
@property (weak, nonatomic) IBOutlet UILabel *goodName;
@property (weak, nonatomic) IBOutlet UILabel *publishTime;

@end

@implementation UserRecordCell

- (void)setModel:(EFReciveOrder *)model{
    if (_model != model) {
        _model = nil;
        _model = model;
        [self loadModel];
    }
}
- (void)loadModel{
    self.userName.text = self.model.user.username;
    self.userAddress.text = self.model.good.title;
    self.goodName.text = [NSString stringWithFormat:@"+%.2lf元",self.model.good.price];
    self.publishTime.text = [NSString stringWithFormat:@"%@",self.model.createdAt];
}


@end
