//
//  EveryDayTableViewController.h
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//
#import "EFCategroy.h"
#import "BasicController.h"
#import <UIKit/UIKit.h>
#import "EFGood.h"
#import "Constanst.h"
@class rilegouleView;


@interface EveryDayTableViewController : BasicController

@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@property(strong,nonatomic) EFCategroy *categroy;




@end
