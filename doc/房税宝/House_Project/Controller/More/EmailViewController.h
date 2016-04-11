//
//  EmailViewController.h
//  House_Project
//
//  Created by lanou3g on 14-11-6.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h> // 导入MessageUI框架

@interface EmailViewController : UIViewController<UITextFieldDelegate,MFMailComposeViewControllerDelegate> // 实现
//正文内容
@property (nonatomic, retain)UITextField *contentTF;
//邮箱
@property (nonatomic, retain)UITextField *adressTextFiled;
@end
