//
//  VideoCell.h
//  E-flyer
//  短片 播放视频的Cell
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoCell.h"
#import "VideoModel.h"
#import "EFGood.h"
@protocol VideoCellDelegate <NSObject>

- (void)videoCellButtonClicked:(EFGood *)model indexPath:(NSIndexPath *)indexPath;

@end


@interface VideoCell : UITableViewCell
@property(strong,nonatomic) EFGood *model;
@property(assign,nonatomic) id<VideoCellDelegate> delegate;
@property(strong,nonatomic) NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet UIButton *btn_send;
@property (weak, nonatomic) IBOutlet UIImageView *img_cover;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UIButton *btn_play;

//无关数据 进行样式代码调整
@property (weak, nonatomic) IBOutlet UIView *ask_view;
@property (weak, nonatomic) IBOutlet UITextField *ask_input;


+ (CGFloat)cellHeight:(EFGood *)model;

@end
