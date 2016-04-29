//
//  CustomHistoryCell.h
//  E-flyer
// 用户浏览记录Cell
//  Created by 张杰 on 16/4/29.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EFReciveOrder;
@interface CustomHistoryCell : UITableViewCell
@property(nonatomic,strong) EFReciveOrder *model;
@end
