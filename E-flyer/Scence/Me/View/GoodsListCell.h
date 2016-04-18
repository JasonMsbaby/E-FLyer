//
//  GoodsListCell.h
//  E-flyer
// 商品列表cell
//  Created by Jason_Msbaby on 16/4/17.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFGood.h"
#import <UIKit/UIKit.h>

@interface GoodsListCell : UICollectionViewCell
@property(strong,nonatomic) EFGood *model;
@end
