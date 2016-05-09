//
//  VideoCell.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFUser.h"
#import "Constanst.h"
#import "VideoCell.h"
#import "UIImageView+EFImageView.h"
#import "WMPlayer.h"
#import "ToolUtils.h"
#import "UILabel+EFLabel.h"
@interface VideoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *partnerName;
@property (weak, nonatomic) IBOutlet UILabel *sendTime;
@property (weak, nonatomic) IBOutlet UILabel *txt_question;

@end

@implementation VideoCell


- (void)setModel:(EFGood *)model{
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
    [_img_cover imagedWithAVFile:self.model.img];
    [_btn_play addTarget:self action:@selector(btnPlay) forControlEvents:(UIControlEventTouchUpInside)];
    [self layoutIfNeeded];
    [self.headImg imagedWithAVFile:self.model.blongUser.barImg];
    self.partnerName.text = self.model.blongUser.barName;
    self.sendTime.text = [ToolUtils StringWithDate:self.model.updatedAt];
    
    [self.lbl_title appendAttributeString:self.model.title FontSize:14 FontColor:[UIColor blackColor] WithWrapNumber:2];
    [self.lbl_title appendAttributeString:self.model.content FontSize:12 FontColor:[UIColor grayColor] WithWrapNumber:0];
    
    self.txt_question.text = self.model.question;
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
