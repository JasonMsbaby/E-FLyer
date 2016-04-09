//
//  BasicController.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/27.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <Masonry.h>
#import "EFUser.h"
#import <UIKit/UIKit.h>
#import "Constanst.h"
#import <SVProgressHUD.h>
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
/*!
 *  根据错误码弹出提示
 *
 *  @param code     常量中配置的错误码
 */
- (void)toastWithCode:(NSInteger)code;
@end
