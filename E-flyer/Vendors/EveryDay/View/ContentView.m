//
//  ContentView.m
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "ContentView.h"
#import "CustomView.h"

@interface ContentView ()
@property(nonatomic,strong) UILabel *lbl_userName;
@property(nonatomic,strong) UILabel *lbl_title;
@property(nonatomic,strong) UILabel *lbl_address;
@property(nonatomic,strong) UILabel *lbl_time;
@property(nonatomic,strong) UILabel *lbl_content;
@property(nonatomic,strong) UILabel *lbl_info;
@property(nonatomic,strong) UIImageView *img_head;
@property(nonatomic,strong) UIButton *btn_Submit;
@property(nonatomic,strong) UILabel *lbl_question;
@property(nonatomic,strong) UITextField *txt_answer;
@end

@implementation ContentView

- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(EFGood *)model collor:(UIColor *)collor{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:(UIBlurEffectStyleDark)];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.frame = self.bounds;
        [self addSubview:effectView];
        //商家头像
        _img_head = [UIImageView new];
        [effectView addSubview:_img_head];
        [_img_head mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self).offset(10);
            make.width.height.equalTo(@50);
        }];
        _img_head.layer.cornerRadius = 25;
        _img_head.clipsToBounds = YES;
        _img_head.backgroundColor = [UIColor whiteColor];
        //商家名称
        _lbl_userName = [UILabel new];
        [effectView addSubview:_lbl_userName];
        [_lbl_userName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_img_head);
            make.left.equalTo(_img_head.mas_right).offset(10);
        }];
        _lbl_userName.font = [UIFont systemFontOfSize:10];
        _lbl_userName.textColor = [UIColor whiteColor];
        _lbl_userName.text = @"商家名称暂无设置";
        //发布时间
        _lbl_time = [UILabel new];
        [effectView addSubview:_lbl_time];
        [_lbl_time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(effectView).offset(-10);
            make.top.equalTo(_img_head);
        }];
        _lbl_time.font = [UIFont systemFontOfSize:10];
        _lbl_time.textColor = [UIColor whiteColor];
        _lbl_time.text = @"1小时前";
        //领取详情
        _lbl_info = [UILabel new];
        [effectView addSubview:_lbl_info];
        [_lbl_info mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_img_head);
            make.right.equalTo(_lbl_time);
        }];
        _lbl_info.font = [UIFont systemFontOfSize:14];
        _lbl_info.text = @"单价:0.50元 / 剩余:5份";
        _lbl_info.textColor = [UIColor whiteColor];
        //单页标题
        _lbl_title = [UILabel new];
        [effectView addSubview:_lbl_title];
        [_lbl_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_img_head);
            make.right.equalTo(effectView).offset(-10);
            make.top.equalTo(_img_head.mas_bottom).offset(10);
        }];
        _lbl_title.text = @"标题标题标题";
        _lbl_title.textColor = [UIColor whiteColor];
        //单页详情
        if (![model.content isEqualToString:@""]) {
            _lbl_content = [UILabel new];
            [effectView addSubview:_lbl_content];
            [_lbl_content mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(_lbl_title);
                make.top.equalTo(_lbl_title.mas_bottom).offset(10);
            }];
            _lbl_content.numberOfLines = 3;
            _lbl_content.font = [UIFont systemFontOfSize:12];
            _lbl_content.textColor = [UIColor whiteColor];
            _lbl_content.text = @"文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本";
        }
        //问题以及回答问题
        if (model.question != nil && ![model.question isEqualToString:@""]) {
            _lbl_question = [UILabel new];
            [effectView addSubview:_lbl_question];
            [_lbl_question mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(_lbl_title);
                if ([model.content isEqualToString:@""]) {
                    make.top.equalTo(_lbl_title.mas_bottom).offset(10);;
                }else{
                    make.top.equalTo(_lbl_content.mas_bottom).offset(10);
                }
            }];
            _lbl_question.font = [UIFont systemFontOfSize:12];
            _lbl_question.textColor = [UIColor whiteColor];
            _lbl_question.lineBreakMode = NSLineBreakByCharWrapping;
            _lbl_question.numberOfLines = 0;
            _lbl_question.text = @"请问:a+b=?";
        }else{
            if (_lbl_content != nil) {
                _lbl_content.numberOfLines = 6;
            }
        }
        //位置详情
        
        //回答问题的区域
        UIView *answerView = [UIView new];
        [effectView addSubview:answerView];
        [answerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(effectView);
            make.height.equalTo(@50);
        }];
        answerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        //回答问题的文本框
        _txt_answer = [UITextField new];
        [answerView addSubview:_txt_answer];
        [_txt_answer mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(answerView).offset(10);
            make.right.equalTo(answerView).offset(-50);
            make.centerY.equalTo(answerView);
            make.height.equalTo(@30);
        }];
        [_txt_answer setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        _txt_answer.backgroundColor = [UIColor clearColor];
        _txt_answer.textColor = [UIColor whiteColor];
        UIColor *white = [UIColor whiteColor];
        _txt_answer.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入问题答案" attributes:@{NSForegroundColorAttributeName:white}];
        _txt_answer.font = [UIFont systemFontOfSize:13];
        _txt_answer.borderStyle = UITextBorderStyleRoundedRect;
        _txt_answer.layer.borderColor = [[UIColor whiteColor] CGColor];
        //获取奖赏的按钮
        _btn_Submit = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
        [answerView addSubview:_btn_Submit];
        [_btn_Submit mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(answerView).offset(-10);
            make.left.equalTo(_txt_answer.mas_right).offset(10);
            make.centerY.height.equalTo(_txt_answer);
        }];
        _btn_Submit.clipsToBounds = YES;
        [_btn_Submit setTitle:@"领取现金" forState:(UIControlStateNormal)];
        _btn_Submit.titleLabel.font = [UIFont systemFontOfSize:12];
        [_btn_Submit setImage:[[UIImage imageNamed:@"btn_receive"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] forState:(UIControlStateNormal)];
        [_btn_Submit setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        //装载数据
        [self setData:model];
    }
    return self;
}

- (void)setData:(EFGood *)model {
    
}


@end
