//
//  SMTPSenderViewController.h
//  DianYue
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 Andy__M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKPSMTPMessage.h"

@interface SMTPSenderViewController : UIViewController<SKPSMTPMessageDelegate,UITextViewDelegate,UITextFieldDelegate>
//正文内容
@property (nonatomic, retain)UITextField *contentTF;
//邮箱
@property (nonatomic, retain)UITextField *adressTextFiled;

@property (nonatomic, retain)UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, retain)UIView *baseView;
@end
