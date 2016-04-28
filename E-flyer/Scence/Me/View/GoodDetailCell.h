//
//  GoodDetailCell.h
//  E-flyer
//  商品详情的cell 只有一个
//  Created by 张杰 on 16/4/28.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFGood.h"
#import <UIKit/UIKit.h>

@protocol GoodDetailCellDelegate <NSObject>
//商品下架
- (void)GoodDetailCellDelegate_UnShelve:(EFGood *)good;
//商品续费
- (void)GoodDetailCellDelegate_Resume:(EFGood *)good;
@end


@interface GoodDetailCell : UITableViewCell

@property(nonatomic,weak) id<GoodDetailCellDelegate> delegate;

@property(nonatomic,strong) EFGood *model;

@end
