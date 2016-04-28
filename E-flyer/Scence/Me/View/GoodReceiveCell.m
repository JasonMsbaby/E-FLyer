//
//  GoodReceiveCell.m
//  E-flyer
//
//  Created by 苗爽 on 16/4/26.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "ToolUtils.h"
#import "GoodReceiveCell.h"

@interface GoodReceiveCell ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end


@implementation GoodReceiveCell

- (void)setModel:(EFReciveOrder *)model{
    if (_model != model) {
        _model = nil;
        _model = model;
        [self loadModel];
    }
}

- (void)loadModel{
    self.userName.text = self.model.user.username;
    self.time.text = [ToolUtils dateFormatSecondWithTime:self.model.createdAt];
}

@end
