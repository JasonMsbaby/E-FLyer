//
//  BarGoodsController.m
//  E-flyer
//
//  Created by 张杰 on 16/5/10.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFUser.h"
#import "EFGood.h"
#import "FlyerNewCell.h"
#import "BarGoodsController.h"
#import <MJRefresh.h>
@interface BarGoodsController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray<EFGood *> *dataSource;

@end

@implementation BarGoodsController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"商铺商品";
    self.navigationController.navigationBarHidden = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTableView];
    [self loadData];
}




- (void)loadTableView{
    self.dataSource = [NSArray array];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 200;
}

/*!
 *  加载数据
 */
- (void)loadData{
    WeakObj(self)
    if (self.barUser != nil) {
        [SVProgressHUD showWithStatus:@"正在请求店家商品数据"];
        [EFGood loadDataWithBelongUserAndLocation:self.barUser Block:^(NSArray<EFGood *> *result) {
            selfWeak.dataSource = result;
            [selfWeak.tableView reloadData];
            [SVProgressHUD dismiss];
        }];
    }
}



#pragma mark -tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FlyerNewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"barGoodsCell"];
    cell.model = self.dataSource[indexPath.row];
    cell.block = ^(EFGood *good,NSString *answer){
        
        [EFGood reveiveMoneyWithGood:good Answer:answer FinishBlock:^{
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationLeft)];
        }];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


@end
