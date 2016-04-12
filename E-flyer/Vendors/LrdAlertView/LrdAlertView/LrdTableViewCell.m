//
//  LrdTableViewCell.m
//  AlertTableView
//
//  Created by 键盘上的舞者 on 3/28/16.
//  Copyright © 2016 键盘上的舞者. All rights reserved.
//

#import "LrdTableViewCell.h"
#import "LrdDateModel.h"
#import "Masonry.h"

@interface LrdTableViewCell ()

@property (nonatomic, strong) UILabel *title;

@end

@implementation LrdTableViewCell

#pragma mark 重写model的set方法

- (void)setModel:(LrdDateModel *)model {
    _model = model;
    self.title.text = model.title;
    //self.time.text = model.time;
    //self.price.text = [NSString stringWithFormat:@"￥ %@", self.model.price];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _title = [[UILabel alloc] init];
        _title.textColor = [UIColor grayColor];
        _title.font = [UIFont systemFontOfSize:13];
        _title.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_title];
        
//        _price = [[UILabel alloc] init];
//        _price.textColor = [UIColor blackColor];
//        _price.font = [UIFont boldSystemFontOfSize:16];
//        [self.contentView addSubview:_price];
        
//        //设置约束
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.top.equalTo(self.contentView.mas_top).offset(10);
        }];
//
//        [_price mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self.contentView.mas_right).offset(-40);
//            make.top.equalTo(self.contentView.mas_top).offset(10);
//        }];
        
    }
    return self;
}

@end
