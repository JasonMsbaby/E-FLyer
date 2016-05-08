//
//  BarListController.m
//  E-flyer
//  商家列表页面
//  Created by 张杰 on 16/5/3.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <MJRefresh.h>
#import "BarListCell.h"
#import "UIView+EFView.h"
#import "BarListController.h"

@interface BarListController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,assign) NSInteger index;
@property(nonatomic,strong) NSMutableArray<EFUser *> *dataSource;

@end

@implementation BarListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem = nil;
    self.title = @"商家";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self loadCollectionView];
    [self addMJRefresh];
}
- (void)loadCollectionView{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((self.view.width - 30)/2, (self.view.width - 30)/2+50);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
    self.collectionView.collectionViewLayout = flowLayout;
}
/*!
 *  加载数据
 */
- (void)loadData{
    WeakObj(self)
    [EFUser barInfoListWithPage:self.index Block:^(NSArray<EFUser *> *result){
        if (result.count == 0) {
            [selfWeak.collectionView.mj_footer endRefreshingWithNoMoreData];
        }else{
            if (selfWeak.index == 1) {
                [selfWeak.dataSource removeAllObjects];
            }
            [selfWeak.dataSource addObjectsFromArray:result];
            [selfWeak.collectionView.mj_footer endRefreshing];
            [selfWeak.collectionView reloadData];
        }
        [selfWeak.collectionView.mj_header endRefreshing];
    }];
}
/*!
 *  添加上拉 下拉刷新
 */
- (void)addMJRefresh{
    self.dataSource = [NSMutableArray array];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.index = 1;
        [self loadData];
    }];
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.index++;
        [self loadData];
    }];
    self.index = 1;
    [self.collectionView.mj_header beginRefreshing];
}




#pragma mark - collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BarListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BarListCell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.item];
    return cell;
}

@end
