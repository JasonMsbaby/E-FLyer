//
//  CustomInComeController.m
//  E-flyer
//  用户收入控制器
//  Created by 张杰 on 16/4/29.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFLog.h"
#import "AcountRecordCell.h"
#import "CustomInComeController.h"
#import <MJRefresh.h>
@interface CustomInComeController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *acountMoney;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray<EFLog *> *dataSource;

@end

@implementation CustomInComeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账户管理";
    [self addMJRefresh];
}
//加载数据
- (void)loadData{
    self.acountMoney.text = [NSString stringWithFormat:@"💰 %.2lf 元",self.currentUser.money];
    WeakObj(self)
    [EFLog LogWithBlock:^(NSArray<EFLog *> * result) {
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
/**
 *  提现
 *
 *  @param sender
 */
- (IBAction)btnOutMoney:(id)sender {
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AcountRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AcountRecordCell"];
    EFLog *model = self.dataSource[indexPath.row];
    cell.model = model;
    return cell;
}

@end
