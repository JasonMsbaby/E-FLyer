//
//  HouseTaxHomeViewController.h
//  House_Project
//
//  Created by lanou3g on 14-11-12.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVSwitch.h"
#import "RNGridMenu.h"
@interface HouseTaxHomeViewController : UIViewController<RNGridMenuDelegate>
@property (nonatomic, retain)DVSwitch *dvSwitch;
@end
