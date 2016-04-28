//
//  GoodDetailController.m
//  E-flyer
//  商品详情
//  Created by 苗爽 on 16/4/26.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "GoodDetailCell.h"
#import "GoodReceiveCell.h"
#import "GoodDetailController.h"

@interface GoodDetailController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GoodDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView{
    self.title = @"商品详情";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        GoodDetailCell *detailCell = [tableView dequeueReusableCellWithIdentifier:@"GoodDetailCell"];
        detailCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return detailCell;
    }else{
        GoodReceiveCell *receiveCell = [tableView dequeueReusableCellWithIdentifier:@"GoodReceiveCell"];
        return receiveCell;
    }
    
}

@end
