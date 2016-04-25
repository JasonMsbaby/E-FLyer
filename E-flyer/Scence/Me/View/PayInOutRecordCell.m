//
//  PayInOutRecordCell.m
//  E-flyer
//  充值 提现 记录cell
//  Created by 苗爽 on 16/4/25.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "ToolUtils.h"
#import "PayInOutRecordCell.h"

@interface PayInOutRecordCell ()
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *source;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end

@implementation PayInOutRecordCell

- (void)setModel:(EFLog *)model{
    if (_model != model) {
        _model = nil;
        _model = model;
        [self loadModel];
    }
}

- (void)loadModel{
    if (self.model.type == EFLogTypeIn) {
        self.money.text = [NSString stringWithFormat:@"+%.2lf元",self.model.money];
    }else{
        self.money.text = [NSString stringWithFormat:@"-%.2lf元",self.model.money];
    }
    self.source.text = self.model.source;
    self.time.text = [NSString stringWithFormat:@"%@",[ToolUtils dateFormatSecondWithTime:self.model.createdAt]];
}

@end
