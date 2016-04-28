//
//  GoodDetailController.m
//  E-flyer
//  商品详情
//  Created by 苗爽 on 16/4/26.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <MJRefresh.h>
#import "GoodDetailCell.h"
#import "GoodReceiveCell.h"
#import "GoodDetailController.h"
#import "EFReciveOrder.h"
#import "EYInputPopupView.h"
@interface GoodDetailController ()<UITableViewDataSource,UITableViewDelegate,GoodDetailCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray <EFReciveOrder *> *dataSource;
@end

@implementation GoodDetailController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self addMJRefresh];
}

- (void)setupView{
    self.title = @"商品详情";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)loadDataSource{
    WeakObj(self)
    [EFReciveOrder userListWithGoods:self.good Block:^(NSArray<EFReciveOrder *> *result) {
        selfWeak.dataSource = result;
        [selfWeak.tableView reloadData];
        [selfWeak.tableView.mj_header endRefreshing];
    }];
}

//添加下拉刷新
- (void)addMJRefresh{
    WeakObj(self)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [selfWeak loadDataSource];
    }];
}

#pragma mark - 领取记录tableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 300;
    }
    return 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return @"领取记录";
    }
    return @"";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        GoodDetailCell *detailCell = [tableView dequeueReusableCellWithIdentifier:@"GoodDetailCell"];
        detailCell.selectionStyle = UITableViewCellSelectionStyleNone;
        detailCell.delegate = self;
        detailCell.model = self.good;
        
        return detailCell;
    }else{
        GoodReceiveCell *receiveCell = [tableView dequeueReusableCellWithIdentifier:@"GoodReceiveCell"];
        EFReciveOrder *model = self.dataSource[indexPath.row];
        receiveCell.model = model;
        return receiveCell;
    }
    
}

#pragma mark - GoodDetailCellDelegate
//商品下架
- (void)GoodDetailCellDelegate_UnShelve:(EFGood *)good{
    [SVProgressHUD showWithStatus:@"正在下架..."];
    [EFGood unShelveGood:good Success:^{
        [SVProgressHUD showSuccessWithStatus:@"商品下架成功,金额已退回到您的账户余额"];
    }];
}
//商品续费
- (void)GoodDetailCellDelegate_Resume:(EFGood *)good{
    [self alerSheetWithTitle:@"商品续费" Message:@"请选择续费方式" Buttons:@[@"支付宝支付",@"微信支付",@"余额支付"] CallBack:^(NSInteger index) {
        switch (index) {
            case 0:
            {
                [EFGood publishWithType:(PayTypeYuEr) Good:good Success:^{
                    
                }];
            }break;
                
            case 1:
            {
                [EFGood publishWithType:(PayTypeWeiXin) Good:good Success:^{
                    
                }];
            }break;
            case 2:
            {
                [EYInputPopupView popViewWithTitle:@"请输入续费数量" contentText:@"0" type:(EYInputPopupView_Type_single_line_number) cancelBlock:nil confirmBlock:^(UIView *view, NSString *text) {
                    
                    good.status = GoodStatusNormal;
                    [SVProgressHUD showWithStatus:@"正在续费..."];
                    //                    [EFGood publishWithType:(PayTypeAliay) Good:good Success:^{
                    //                        [SVProgressHUD showSuccessWithStatus:@"续费成功"];
                    //                    }];
                } dismissBlock:nil];
                
            }break;
                
            default:
                break;
        }
    }];
}

@end
