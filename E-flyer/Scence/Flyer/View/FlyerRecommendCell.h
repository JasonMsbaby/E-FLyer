//
//  FlyerRecommendCell.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFGood.h"
#import <UIKit/UIKit.h>
/*!
 *  @author Jason_Msbaby, 16-03-01 11:03:30
 *
 *  首页推荐 Cell 视图
 */
@interface FlyerRecommendCell : UITableViewCell

/*!
 *  布局
 */
- (void)layout:(NSArray<EFGood *> *)data;

@end
