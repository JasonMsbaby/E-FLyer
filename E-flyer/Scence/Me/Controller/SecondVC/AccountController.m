//
//  AccountController.m
//  E-flyer
//  账户管理
//  Created by 苗爽 on 16/4/23.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <MJRefresh.h>
#import "EYInputPopupView.h"
#import "EFLog.h"
#import "AcountRecordCell.h"
#import "AccountController.h"
#import "PayInOutController.h"

@interface AccountController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *money;

@property(nonatomic,strong) NSArray *dataSource;
@end

@implementation AccountController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self.tableView.mj_header beginRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addMJRefresh];
    self.title = @"账户管理";
    self.tableView.rowHeight = 50;
}
//加载数据
- (void)loadData{
    self.money.text = [NSString stringWithFormat:@"💰 %.2lf 元",self.currentUser.money];
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
}
#pragma mark - 充值/提现操作
//提现
- (IBAction)btnOutMoneyAction:(id)sender {
    PayInOutController *payInVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PayInOutController"];
    payInVC.type = EFLogTypeOut;
    payInVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:payInVC animated:YES];
}
//充值
- (IBAction)btnInMoneyAction:(id)sender {
    PayInOutController *payInVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PayInOutController"];
    payInVC.type = EFLogTypeIn;
    payInVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:payInVC animated:YES];
}

#pragma mark - 账单记录tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AcountRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AcountRecordCell"];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

@end
