//
//  VideoPlayController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/2.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "VideoPlayController.h"
#import "WMPlayer.h"

@interface VideoPlayController ()
@property (weak, nonatomic) IBOutlet UIView *play_ground;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong,nonatomic) WMPlayer *wmplay;
@end

@implementation VideoPlayController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startVideo];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self stopVideo];
}


- (void)startVideo{
    [_play_ground addSubview:self.wmplay];
    if (self.wmplay.currentItem != nil) {
        [self.wmplay.player play];
    }else{
        [self.wmplay setVideoURLStr:_model.mp4_url];
    }
}

//- (void)playOrpause{
//    if ([_wmplay.player is]) {
//        <#statements#>
//    }
//}


- (void)stopVideo{
    [self.wmplay.player.currentItem cancelPendingSeeks];
    [self.wmplay.player.currentItem.asset cancelLoading];
    
    [self.wmplay.player pause];
    [self.wmplay removeFromSuperview];
    [self.wmplay.playerLayer removeFromSuperlayer];
    [self.wmplay.player replaceCurrentItemWithPlayerItem:nil];
    
//    self.wmplay = nil;
//    self.wmplay.player = nil;
//    self.wmplay.currentItem = nil;
//    
//    self.wmplay.playOrPauseBtn = nil;
//    self.wmplay.playerLayer = nil;

}
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (WMPlayer *)wmplay{
    if (_wmplay == nil) {
        _wmplay = [[WMPlayer alloc]initWithFrame:_play_ground.bounds videoURLStr:_model.mp4_url];
    }
    return _wmplay;
}


@end
