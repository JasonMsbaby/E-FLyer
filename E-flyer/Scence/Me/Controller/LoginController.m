//
//  LoginController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "RegistController.h"
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
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)winxinLoginAction:(id)sender {
}
- (IBAction)forgetPwdAction:(id)sender {
    RegistController *findPwdVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RegistController"];
    findPwdVC.RegistControllerType = RegistControllerTypeForGetPwd;
    [self presentViewController:findPwdVC animated:YES completion:nil];
}
- (IBAction)registAction:(id)sender {
    RegistController *registVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RegistController"];
    registVC.RegistControllerType = RegistControllerTypeRegist;
    [self presentViewController:registVC animated:YES completion:nil];
}
- (IBAction)loginAction:(id)sender {
    [SVProgressHUD show];
    WeakObj(self)
    [EFUser logInWithMobilePhoneNumberInBackground:self.phone.text password:self.password.text block:^(AVUser *user, NSError *error) {
        if (error != nil) {
            NSLog(@"%@",error);
            [selfWeak toastWithError:error];
            return ;
        }
        [self.navigationController popViewControllerAnimated:YES];
        [SVProgressHUD dismiss];
    }];
}

@end
