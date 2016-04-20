//
//  FlyerController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/27.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EveryDayTableViewController.h"
#import "FlyerNewListController.h"
#import "EFGood.h"
#import "FlyerController.h"
#import "SearchController.h"
#import "FlyerHeaderView.h"
#import <MJRefresh.h>
#import "FlyerRecommendCell.h"
#import "FlyerNewCell.h"
#import "EFCategroy.h"

@interface FlyerController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) FlyerHeaderView *headerView;
@property(strong,nonatomic) NSMutableArray<EFGood *> *data_new;
@property(assign,nonatomic) NSInteger index;
@end
@implementation FlyerController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加头视图
    self.headerView = [[FlyerHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/2+20)];
    self.headerView.data = [EFCategroy shareInstance].data;
    WeakObj(self);
    self.headerView.block = ^(NSInteger index,EFCategroy *categroy){
        EveryDayTableViewController *listVC = [[EveryDayTableViewController alloc] init];
        listVC.categroy = categroy;
        listVC.hidesBottomBarWhenPushed = YES;
        [selfWeak.navigationController pushViewController:listVC animated:YES];
    };
    self.data_new = [NSMutableArray array];
    
    self.tableView.tableHeaderView = self.headerView;
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[FlyerRecommendCell class] forCellReuseIdentifier:@"recommendCell"];
    self.index = 1;
    [self loadData];
    [self addMJRefresh];
}
/*!
 *  加载数据
 */
- (void)loadData{
    WeakObj(self)
    [EFGood loadDataWithNewIndex:self.index Block:^(NSArray<EFGood *> *result) {
        if (result.count == 0) {
            [selfWeak.tableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            if (selfWeak.index == 1) {
                [selfWeak.data_new removeAllObjects];
            }
            [selfWeak.data_new addObjectsFromArray:result];
            [selfWeak.tableView.mj_footer endRefreshing];
            [selfWeak.tableView.mj_header endRefreshing];
            [selfWeak.tableView reloadData];
        }
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

//扫一扫
- (IBAction)btn_saoyisao:(UIButton *)sender {
    NSLog(@"扫一扫");
    self.navigationController.navigationBarHidden = NO;
    
    UIViewController *vc = [[BasicController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
//搜索
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    SearchController *searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchController"];
    searchVC.view.backgroundColor = [UIColor whiteColor];
    searchVC.hidesBottomBarWhenPushed = YES;
    [self showViewController:searchVC sender:nil];
    
    NSLog(@"搜索一下");
    return  false;
}
#pragma mark - tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (section == 0) {
//        return 1;
//    }
    return self.data_new.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        return 150;
//    }
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        FlyerRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recommendCell"];
//        [cell layout:self.data_new];
//        return cell;
//    }else{
        FlyerNewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FlyerYouLikeCell"];
        cell.model = self.data_new[indexPath.row];
        return cell;
//    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    if (section == 0) {
//        return @"今日推荐";
//    }
    return  @"最新上架";
}



@end
