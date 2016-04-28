//
//  PayInOutController.m
//  E-flyer
//
//  Created by 苗爽 on 16/4/25.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <MJRefresh.h>
#import "PayInOutController.h"
#import "PayInOutRecordCell.h"
@interface PayInOutController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *currentMoney;
@property (weak, nonatomic) IBOutlet UITextField *money;
@property (weak, nonatomic) IBOutlet UILabel *lbl_type;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray<EFLog *> *dataSource;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;

@end

@implementation PayInOutController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.type == EFLogTypeIn) {//充值
        self.title = @"充值";
        self.lbl_type.text = @"充值记录";
        [self.btnSubmit setTitle:@"充值" forState:(UIControlStateNormal)];
        
    }else{
        self.title = @"提现";
        self.lbl_type.text = @"提现记录";
        [self.btnSubmit setTitle:@"提现" forState:(UIControlStateNormal)];
    }
    self.currentMoney.text = [NSString stringWithFormat:@"%.2lf元",self.currentUser.money];
    [self.tableView.mj_header beginRefreshing];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addMJRefresh];
}
//加载充值 提现 记录
- (void)loadRecord{
    WeakObj(self)
    [EFLog LogWithType:self.type Block:^(NSArray<EFLog *> *result) {
        selfWeak.dataSource = result;
        [selfWeak.tableView reloadData];
        [selfWeak.tableView.mj_header endRefreshing];
    }];
}
//添加下拉刷新
- (void)addMJRefresh{
    WeakObj(self)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [selfWeak loadRecord];
    }];
}
//点击充值或者提现
- (IBAction)btnSubmitAction:(id)sender {
    if ([self.money.text isEqualToString:@""] || [self.money.text floatValue] <= 0) {
        [SVProgressHUD showErrorWithStatus:@"金额应大于0元"];
        return ;
    }
    if (self.type == EFLogTypeIn) {//如果是充值的话
        [self alerSheetWithTitle:@"充值" Message:@"请选择充值方式" Buttons:@[@"支付宝支付",@"微信支付",@"测试支付"] CallBack:^(NSInteger index) {
            switch (index) {
                case 0:
                    [self payInWithAliayPay];
                    break;
                case 1:
                    [self payInWithWeiXinPay];
                    break;
                case 2:
                    [self payInWithTest];
                    break;
            }
        }];
    }else{//如果是提现的话
        [self alerSheetWithTitle:@"提现" Message:@"请选择提现到?" Buttons:@[@"支付宝账户",@"微信账户",@"测试账户"] CallBack:^(NSInteger index) {
            switch (index) {
                case 0:
                    [self payOutWithAliayPay];
                    break;
                case 1:
                    [self payOutWithWeiXinPay];
                    break;
                case 2:
                    [self payOutWithTest];
                    break;
            }
        }];
    }
    
    
}
#pragma mark - 充值
- (void)payInWithAliayPay{
    [SVProgressHUD showInfoWithStatus:@"测试中，暂未开通"];
}
- (void)payInWithWeiXinPay{
    [SVProgressHUD showInfoWithStatus:@"测试中，暂未开通"];
}
- (void)payInWithTest{
    [SVProgressHUD showInfoWithStatus:@"正在充值,请稍后..."];
    self.currentUser.money += [self.money.text floatValue];
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            //创建充值记录
            [EFLog saveLogWithType:(EFLogTypeIn) Source:@"测试充值" Money:[self.money.text floatValue] Good:nil Finish:^(BOOL success) {
                
                [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"充值成功,成功充入%.2lf元",[self.money.text floatValue]]];
                
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }else{
            [self toastWithError:error];
        }
    }];
}
#pragma mark - 提现
- (void)payOutWithAliayPay{
    [SVProgressHUD showInfoWithStatus:@"测试中，暂未开通"];
}
- (void)payOutWithWeiXinPay{
    [SVProgressHUD showInfoWithStatus:@"测试中，暂未开通"];
}
- (void)payOutWithTest{
    [SVProgressHUD showInfoWithStatus:@"正在提现,请稍后..."];
    self.currentUser.money -= [self.money.text floatValue];
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            //创建充值记录
            [EFLog saveLogWithType:(EFLogTypeOut) Source:@"测试提现" Money:[self.money.text floatValue] Good:nil Finish:^(BOOL success) {
                
                [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"提现请求已申请,请耐心等候..."]];
                
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }else{
            [self toastWithError:error];
        }
    }];
}

#pragma mark - 记录tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PayInOutRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PayInOutRecordCell"];
    EFLog *log = self.dataSource[indexPath.row];
    cell.model = log;
    return cell;
}



@end
