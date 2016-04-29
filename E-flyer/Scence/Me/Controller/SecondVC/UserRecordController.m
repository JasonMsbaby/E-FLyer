//
//  UserRecordController.m
//  E-flyer
//  用户领取记录
//  Created by 苗爽 on 16/4/23.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "UserRecordCell.h"
#import "UserRecordController.h"
#import "EFReciveOrder.h"

@interface UserRecordController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray *dataSource;

@end

@implementation UserRecordController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户领取记录";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.rowHeight = 40;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataSource = [NSArray array];
    [SVProgressHUD showWithStatus:@"正在请求用户数据，请稍后..."];
    WeakObj(self);
    [EFReciveOrder allReceiveWithCurrentBarBlock:^(NSArray<EFReciveOrder *> *result) {
        selfWeak.dataSource = result;
        [selfWeak.tableView reloadData];
        [SVProgressHUD dismiss];
    }];
}


#pragma mark - tableview数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userRecordCell"];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}


@end
