//
//  VideoCell.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "Constanst.h"
#import "VideoCell.h"
#import "UIImageView+WebCache.h"
#import "WMPlayer.h"
@interface VideoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *partnerName;
@property (weak, nonatomic) IBOutlet UILabel *sendTime;
@property (weak, nonatomic) IBOutlet UILabel *problem;
@end

@implementation VideoCell


- (void)setModel:(VideoModel *)model{
    if(_model != model){
        _model = nil;
        _model = model;
        [self layout];
    }
}

- (void)layout{
    if (self.model.isplaying) {
        _btn_play.hidden = YES;
    }else{
        _btn_play.hidden = NO;
    }
    [_btn_send setImage:[UIImage imageNamed:@"sendButton_focus"] forState:(UIControlStateSelected)];
    self.img_cover.userInteractionEnabled = YES;
    self.ask_view.layer.borderWidth = 1;
    self.ask_view.layer.cornerRadius = 4;
    self.ask_view.clipsToBounds = YES;
    self.ask_view.layer.borderColor = [[UIColor colorWithWhite:0.800 alpha:1.000] CGColor];
    _lbl_title.text = [NSString stringWithFormat:@"%@%@%@",self.model.des,self.model.title,self.model.title];
    [_img_cover sd_setImageWithURL:[NSURL URLWithString:self.model.cover]];
    [_btn_play addTarget:self action:@selector(btnPlay) forControlEvents:(UIControlEventTouchUpInside)];
    [self layoutIfNeeded];
}

- (void)btnPlay{
    _btn_play.hidden = YES;
    if (self.delegate != nil) {
        [self.delegate videoCellButtonClicked:_model indexPath:_indexPath];
    }
}

+ (CGFloat)cellHeight:(VideoModel*)model{
    CGRect rect = [model.title boundingRectWithSize:CGSizeMake(kScreenWidth - 20, 1000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    return rect.size.height;
}
@end
