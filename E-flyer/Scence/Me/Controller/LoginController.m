//
//  LoginController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "LoginController.h"


@interface LoginController ()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *weixinLogin;

@end

@implementation LoginController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initView];
    
}
- (void)initView{
    _headImg.layer.cornerRadius = 5;
    _headImg.clipsToBounds = YES;
    _btnLogin.layer.cornerRadius = _weixinLogin.layer.cornerRadius = 3;
    _btnLogin.clipsToBounds = _weixinLogin.clipsToBounds =  YES;
    _btnLogin.layer.backgroundColor = [[UIColor colorWithRed:0.000 green:0.502 blue:0.000 alpha:1.000] CGColor];
    _weixinLogin.backgroundColor = [UIColor whiteColor];
}


#pragma mark - 按钮事件操作
- (IBAction)winxinLoginAction:(id)sender {
}
- (IBAction)forgetPwdAction:(id)sender {
}
- (IBAction)registAction:(id)sender {
}
- (IBAction)loginAction:(id)sender {
}

@end
