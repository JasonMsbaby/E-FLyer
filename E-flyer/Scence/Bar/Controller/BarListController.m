//
//  BarListController.m
//  E-flyer
//  商家列表页面
//  Created by 张杰 on 16/5/3.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "BarListCell.h"
#import "UIView+EFView.h"
#import "BarListController.h"

@interface BarListController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation BarListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadCollectionView];
}
- (void)loadCollectionView{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((self.view.width - 30)/2, (self.view.width - 30)/2+50);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
    self.collectionView.collectionViewLayout = flowLayout;
    
}



#pragma mark - collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BarListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BarListCell" forIndexPath:indexPath];
    cell.backgroundColor = kRandomColor;
    
    return cell;
}

@end
