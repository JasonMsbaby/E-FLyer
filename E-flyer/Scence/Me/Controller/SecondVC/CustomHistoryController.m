//
//  CustomHistoryController.m
//  E-flyer
//  用户查看自己的历史记录控制器
//  Created by 张杰 on 16/4/29.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <MJRefresh.h>
#import "EFReciveOrder.h"
#import "CustomHistoryController.h"
#import "CustomHistoryCell.h"

@interface CustomHistoryController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray<EFReciveOrder *> *dataSource;

@end

@implementation CustomHistoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"历史记录";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addMJRefresh];
}
//加载数据
- (void)loadData{
    WeakObj(self)
    [EFReciveOrder allReceiveWithCurrentBarBlock:^(NSArray<EFReciveOrder *> *result) {
        selfWeak.dataSource = result;
        [selfWeak.tableView reloadData];
        [selfWeak.tableView.mj_header endRefreshing];
    }];
}
//添加下拉刷新
- (void)addMJRefresh{
    WeakObj(self)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [selfWeak loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
}


#pragma mark - tablewViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomHistoryCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CustomHistoryCell"];
    cell.model = self.dataSource[indexPath.row];
    return  cell;
}

@end
