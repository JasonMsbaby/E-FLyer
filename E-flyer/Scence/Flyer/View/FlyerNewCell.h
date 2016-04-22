//
//  FlyerYouLikeCell.h
//  E-flyer
//  最新上架
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFGood.h"
typedef void(^ButtonReceiveBlock)(EFGood *good,NSString *answer);
@interface FlyerNewCell : UITableViewCell

@property(strong,nonatomic) EFGood *model;
@property(nonatomic,copy) ButtonReceiveBlock block;

@end
