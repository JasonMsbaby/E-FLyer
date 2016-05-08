//
//  VideoController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/2.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFGood.h"
#import "VideoController.h"
#import "VideoModel.h"
#import "VideoCell.h"
#import <MJRefresh.h>
#import "VideoCarousel.h"
#import "VideoPlayController.h"
#import "WMPlayer.h"
#import "SVProgressHUD.h"

@interface VideoController ()<UITableViewDelegate,UITableViewDataSource,VideoCellDelegate>
@property(strong,nonatomic) NSMutableArray<EFGood *> *data;
@property(strong,nonatomic) WMPlayer *wmplayer;
@property(strong,nonatomic) VideoCell *currentCell;
@property(strong,nonatomic) NSIndexPath *currentIndexPath;
@property(nonatomic,assign) NSInteger index;
@end

@implementation VideoController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.navigationItem.leftBarButtonItem = nil;
    self.title = @"短视频";
//    [self loadCarousel];
    self.index = 1;
    self.data = [NSMutableArray array];
    [self addMJRefresh];
    [self addNotification];
}
- (void)addNotification{
    //注册播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoDidFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    //关闭通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(videoDidFinished:)
                                                 name:@"closeTheVideo"
                                               object:nil
     ];
    
}

- (void)videoDidFinished:(UIButton *)btn{
    [self videoStop];
    [SVProgressHUD showInfoWithStatus:@"播放完毕,请回答问题后提交获取奖励"];
    [_currentCell.ask_input becomeFirstResponder];
}

- (void)addMJRefresh{
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.index = 1;
        [self loadData];
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.index++;
        [self loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
}
- (void)loadCarousel{
    VideoCarousel *carousel = [[VideoCarousel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
    self.tableView.tableHeaderView = carousel;
}
- (void)loadData{
    [EFGood loadDataWithCategroy:nil SourceType:(EFGoodTypeVideo) PageIndex:self.index Block:^(NSArray<EFGood *> *result) {
        if (self.index == 1) {
            [self.data removeAllObjects];
        }else{
            if (result != nil && result.count == 0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [self.tableView.mj_footer endRefreshing];
            }
         }
        [self.data addObjectsFromArray:result];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
    }];
}

#pragma mark - tableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoCell"];
    cell.model = self.data[indexPath.section];
    cell.delegate = self;
    cell.indexPath = indexPath;
    if (_currentIndexPath != indexPath) {
        [self videoStop];
    }
    [cell.btn_send addTarget:self action:@selector(btnSendClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    return  cell;
}
#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [VideoCell cellHeight:self.data[indexPath.section]] + (kScreenWidth - 20)*9/16 + 200;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section != 0) {
        return 20;
    }
    return 0;
}
#pragma mark - VideoCellDelegate
/*!
 *  播放按钮点击代理
 *
 *  @param model     传过来的model
 *  @param indexPath 传过来的indexPath
 */
-(void)videoCellButtonClicked:(EFGood *)model indexPath:(NSIndexPath *)indexPath{
    _currentIndexPath = indexPath;
    model.isplaying = YES;
    VideoCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
    [self playWithPath:model.video.url onCell:cell];
}
#pragma mark - 视频相关
/*!
 *  开始播放视频
 *
 *  @param path 视频的路径
 *  @param cell 在哪一个cell上进行播放
 */
- (void)playWithPath:(NSString *)path onCell:(VideoCell *)cell{
    _currentCell = cell;
    if (_wmplayer) {
        [_wmplayer removeFromSuperview];
        [_wmplayer setVideoURLStr:path];
        [_wmplayer.player play];
        
    }else{
        _wmplayer = [[WMPlayer alloc]initWithFrame:cell.img_cover.bounds videoURLStr:path];
        [_wmplayer.player play];
        
    }
    [cell.img_cover addSubview:_wmplayer];
    [cell.img_cover bringSubviewToFront:_wmplayer];
}
/*!
 *  停止播放
 */
- (void)videoStop{
    
    [_wmplayer.player.currentItem cancelPendingSeeks];
    [_wmplayer.player.currentItem.asset cancelLoading];
    
    [_wmplayer.player pause];
    [_wmplayer removeFromSuperview];
    [_wmplayer.playerLayer removeFromSuperlayer];
    [_wmplayer.player replaceCurrentItemWithPlayerItem:nil];
    _wmplayer = nil;
    _wmplayer.player = nil;
    _wmplayer.currentItem = nil;
    
    _wmplayer.playOrPauseBtn = nil;
    _wmplayer.playerLayer = nil;
    _currentIndexPath = nil;

    
    _currentCell.btn_play.hidden = NO;
    self.data[_currentIndexPath.row].isplaying = NO;
}

#pragma mark - 事件相应
- (void)btnSendClicked:(UIButton *)sender{
    [SVProgressHUD showInfoWithStatus:@"+1"];
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
