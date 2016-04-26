//
//  GoodDetailController.m
//  E-flyer
//  商品详情
//  Created by 苗爽 on 16/4/26.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
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
}

#pragma mark - 领取记录tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodReceiveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodReceiveCell"];
    return cell;
}

@end
