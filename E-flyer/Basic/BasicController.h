//
//  BasicController.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/27.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFUser.h"
#import <UIKit/UIKit.h>
#import "Constanst.h"
@interface BasicController : UIViewController
@property(strong,nonatomic) EFUser *currentUser;

/*!
 *  弹出框
 *
 *  @param title    title description
 *  @param message  message description
 *  @param callback     
 */
- (void)alerWithTitle:(NSString *)title Message:(NSString *)message CallBack:(void(^)())callback;

@end
