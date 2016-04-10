//
//  MeMenu.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFUser.h"
#import <Foundation/Foundation.h>

@interface MeMenu : NSObject

@property(strong,nonatomic) NSString *idd;
@property(strong,nonatomic) NSString *title;
@property(strong,nonatomic) NSString *img;


/*!
 *  商家个人中心菜单
 *
 *  @return
 */
+ (NSDictionary *)menuListWithUser:(EFUser *)currentUser;

@end
