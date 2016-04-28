//
//  GoodReceiveCell.h
//  E-flyer
//  商品详情页面 该商品对应的领取记录的cell
//  Created by 苗爽 on 16/4/26.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFReciveOrder.h"
#import <UIKit/UIKit.h>

@interface GoodReceiveCell : UITableViewCell
@property(nonatomic,strong) EFReciveOrder *model;
@end
