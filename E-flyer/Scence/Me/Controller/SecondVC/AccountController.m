//
//  AccountController.m
//  E-flyer
//  账户管理
//  Created by 苗爽 on 16/4/23.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
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
    [self loadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账户管理";
    self.tableView.rowHeight = 50;
}
//加载数据
- (void)loadData{
    self.money.text = [NSString stringWithFormat:@"💰 %.2lf 元",self.currentUser.money];
    [SVProgressHUD showWithStatus:@"正在加载账户信息,请稍后..."];
    WeakObj(self)
    [EFLog LogWithBlock:^(NSArray<EFLog *> * result) {
        selfWeak.dataSource = result;
        [selfWeak.tableView reloadData];
        [SVProgressHUD dismiss];
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
