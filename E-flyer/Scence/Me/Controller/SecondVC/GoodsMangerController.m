//
//  GoodsMangerController.m
//  E-flyer
//  商品管理控制器
//  Created by Jason_Msbaby on 16/4/17.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFGood.h"
#import "GoodsListCell.h"
#import "GoodsMangerController.h"
#import "GoodDetailController.h"
@interface GoodsMangerController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(strong,nonatomic) NSArray<EFGood *> *dataSources;
@end

@implementation GoodsMangerController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self loadCollectionView];
    [self loadData];
}
- (void)loadCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 10, 10);
    flowLayout.itemSize = CGSizeMake((kScreenWidth-30)/2, (kScreenWidth-30)/2+50);
    self.collectionView.collectionViewLayout = flowLayout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}
//加载网络数据
- (void)loadData{
    if (self.current == nil) {
        self.title = @"商品管理";
        self.current = self.currentUser;
    }else{
        self.title = @"店铺商品";
    }
    if (self.current != nil) {
        [SVProgressHUD showWithStatus:@"正在努力加载数据..."];
        [EFGood loadDataWithBelongUser:self.current Block:^(NSArray<EFGood *> *result) {
            self.dataSources = result;
            [self.collectionView reloadData];
            [SVProgressHUD dismiss];
        }];
    }
}
#pragma mark - collectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSources.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodsListCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsListCell" forIndexPath:indexPath];
    EFGood *good = self.dataSources[indexPath.item];
    cell.model = good;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    EFGood *good = self.dataSources[indexPath.item];
    GoodDetailController *goodDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GoodDetailController"];
    goodDetailVC.hidesBottomBarWhenPushed = YES;
    goodDetailVC.good = good;
    [self.navigationController pushViewController:goodDetailVC animated:YES];
}
@end
