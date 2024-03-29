//
//  FlyerHeaderView.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/29.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFCategroy.h"
/**
 *  传单首页的八宫格视图
 */
typedef void(^FlyerHeaderBlock)(NSInteger index,EFCategroy *categroy);

@interface FlyerHeaderView : UIView



@property(strong,nonatomic) NSArray<EFCategroy *> *data;

@property(copy,nonatomic) FlyerHeaderBlock block;

@end
