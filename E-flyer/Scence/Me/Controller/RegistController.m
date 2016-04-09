//
//  RegistController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "RegistController.h"

@interface RegistController ()
@property (weak, nonatomic) IBOutlet UIButton *btn_valid;
@property (weak, nonatomic) IBOutlet UIButton *btn_regist;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *pwd1;
@property (weak, nonatomic) IBOutlet UITextField *pwd2;

@end

@implementation RegistController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}


- (void)setupView{
    [_btn_valid setBackgroundColor:[UIColor colorWithWhite:0.600 alpha:1.000]];
    [_btn_regist setBackgroundColor:[UIColor colorWithRed:0.000 green:0.502 blue:0.251 alpha:1.000]];
    _btn_regist.layer.cornerRadius = 3;
    _btn_regist.clipsToBounds = YES;
}

/*!
 *  后退
 *
 *  @param sender
 */
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*!
 *  注册用户
 *
 *  @param sender sender description
 */
- (IBAction)regist:(id)sender {
    if ([self.userName.text isEqualToString:@""]) {
        [self alerWithTitle:@"提示" Message:@"用户名不能为空" CallBack:nil];
        return;
    }
    if ([self.pwd1.text isEqualToString:self.pwd2.text]) {
        EFUser *user = [EFUser user];
        user.username = [NSString stringWithFormat:@"%@_新用户",self.userName.text];
        user.password = self.pwd1.text;
        user.mobilePhoneNumber = self.userName.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                [self alerWithTitle:@"注册成功，请返回登录页登录" Message:nil CallBack:^{
                    [self close:nil];
                }];
            }else{
                [self toastWithError:error];
            }
        }];
    }else{
        [self alerWithTitle:@"提示" Message:@"两次输入的密码不一致" CallBack:nil];
    }
}


@end
