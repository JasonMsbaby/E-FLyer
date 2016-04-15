//
//  FlyerController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/27.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFGood.h"
#import "FlyerController.h"
#import "SearchController.h"
#import "FlyerHeaderView.h"
#import <MJRefresh.h>
#import "FlyerRecommendCell.h"
#import "FlyerYouLikeCell.h"
#import "EFCategroy.h"

@interface FlyerController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) FlyerHeaderView *headerView;
@property(strong,nonatomic) NSArray<EFGood *> *data_new;
@end
@implementation FlyerController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    WeakObj(self)
    [EFGood loadDataWithNewBlock:^(NSArray<EFGood *> *result) {
        selfWeak.data_new = result;
        [selfWeak.tableView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加头视图
    self.headerView = [[FlyerHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/2+20)];
    self.tableView.tableHeaderView = self.headerView;
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[FlyerRecommendCell class] forCellReuseIdentifier:@"recommendCell"];
    
    [self loadData];
    [self addMJRefresh];
}
/*!
 *  加载数据
 */
- (void)loadData{
    self.headerView.data = [EFCategroy shareInstance].data;
    [self.tableView reloadData];
}
/*!
 *  添加上拉 下拉刷新
 */
- (void)addMJRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        sleep(2);
        NSLog(@"下拉刷新");
        [self.tableView.mj_header endRefreshing];
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
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return self.data_new.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 150;
    }
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FlyerRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recommendCell"];
        [cell layout:self.data_new];
        return cell;
    }else{
        FlyerYouLikeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FlyerYouLikeCell"];
        cell.model = self.data_new[indexPath.row];
        return cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"今日推荐";
    }
    return  @"最新上架";
}



@end
