//
//  AccountController.m
//  E-flyer
//  账户管理
//  Created by 苗爽 on 16/4/23.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "AcountRecordCell.h"
#import "AccountController.h"

@interface AccountController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AccountController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账户管理";
    self.tableView.rowHeight = 50;
}

#pragma mark - 账单记录tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AcountRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AcountRecordCell"];
    return cell;
}

@end
