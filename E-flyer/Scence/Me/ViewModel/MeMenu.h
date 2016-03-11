//
//  MeMenu.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeMenu : NSObject

@property(strong,nonatomic) NSString *idd;
@property(strong,nonatomic) NSString *title;
@property(strong,nonatomic) NSString *img;


/*!
 *  获取个人中心的菜单列表
 *
 *  @return
 */
+ (NSDictionary *)menuList;

@end
