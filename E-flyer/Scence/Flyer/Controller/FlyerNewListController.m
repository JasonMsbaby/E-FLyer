//
//  FlyerListController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/17.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <MJRefresh.h>
#import "FlyerNewListController.h"
#import "FlyerNewCell.h"

@interface FlyerNewListController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSMutableArray<EFGood *> *dataSource;
@property(assign,nonatomic) NSInteger index;
@end

@implementation FlyerNewListController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.categroy.name;
    [self loadTableView];
    [self addMJRefresh];
    [self loadData];
}

- (void)loadTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    UIView *bottom = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView setTableFooterView:bottom];
}

/*!
 *  加载数据
 */
- (void)loadData{
    [SVProgressHUD showWithStatus:kLoadingMesssage];
    self.dataSource = [NSMutableArray array];
    WeakObj(self)
    [EFGood loadDataWithCategroy:self.categroy PageIndex:self.index Block:^(NSArray<EFGood *> *result){
        if (result.count == 0) {
            [selfWeak.tableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            if (selfWeak.index == 1) {
                [selfWeak.dataSource removeAllObjects];
            }
            [selfWeak.dataSource addObjectsFromArray:result];
            [selfWeak.tableView.mj_footer endRefreshing];
            [selfWeak.tableView.mj_header endRefreshing];
            [selfWeak.tableView reloadData];
        }
        [SVProgressHUD dismiss];
    }];
}
/*!
 *  添加上拉 下拉刷新
 */
- (void)addMJRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.index = 1;
        [self loadData];
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.index++;
        [self loadData];
    }];
}




#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FlyerNewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FlyerListCell"];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}


@end
