//
//  RegistController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "NSTimer+EFTimer.h"
#import "RegistController.h"

@interface RegistController ()
@property (weak, nonatomic) IBOutlet UIButton *btn_valid;
@property (weak, nonatomic) IBOutlet UIButton *btn_regist;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *pwd1;
@property (weak, nonatomic) IBOutlet UITextField *pwd2;
@property (weak, nonatomic) IBOutlet UITextField *txt_valideCode;
@property(strong,nonatomic) NSTimer *timer;
@property(assign,nonatomic) NSInteger time_span;

@end

@implementation RegistController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}


- (void)setupView{
    [_btn_valid setBackgroundColor:[UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000]];
    [_btn_regist setBackgroundColor:[UIColor colorWithRed:0.000 green:0.502 blue:0.251 alpha:1.000]];
    _btn_regist.layer.cornerRadius = 3;
    _btn_regist.clipsToBounds = YES;
    self.time_span = kRegist_Time;
    self.timer =[NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerInterval:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer pause];
}
/*!
 *  发送验证码
 *
 *  @param sender
 */
- (IBAction)btn_sendValideCode:(id)sender {
    if (self.userName.text != nil) {
        [AVOSCloud requestSmsCodeWithPhoneNumber:self.userName.text callback:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                [SVProgressHUD showInfoWithStatus:@"发送验证码成功,请耐心等待"];
                [self.timer resume];
            }else{
                [self toastWithError:error];
            }
        }];
    }else{
        [SVProgressHUD showErrorWithStatus:@"请填写手机号!"];
    }
}
- (void)timerInterval:(NSTimer *)t{
    [self.btn_valid setTitle:[NSString stringWithFormat:@"%ld",self.time_span] forState:(UIControlStateNormal)];
    
    if (self.time_span == 0) {
        [_btn_valid setBackgroundColor:[UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000]];
        [self.btn_valid setTitle:@"获取验证码" forState:(UIControlStateNormal)];
        [self.btn_valid setEnabled:YES];
        self.time_span = kRegist_Time;
        [self.timer pause];
    }else{
        [_btn_valid setBackgroundColor:[UIColor colorWithWhite:0.600 alpha:1.000]];
        [self.btn_valid setEnabled:NO];
    }
    
    self.time_span--;
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
        [SVProgressHUD showInfoWithStatus:@"用户名不能为空"];
        return;
    }
    if (![self.pwd1.text isEqualToString:self.pwd2.text]) {
        [SVProgressHUD showInfoWithStatus:@"两次输入的密码不一致"];
        return;
    }
    
    WeakObj(self)
    [self registWithRoleWithBlock:^(int type) {
        if (type != -1) {
            [SVProgressHUD show];
            [EFUser signUpOrLoginWithMobilePhoneNumberInBackground:self.userName.text smsCode:self.txt_valideCode.text block:^(AVUser *user, NSError *error) {
                if (error!= nil) {
                    [self toastWithError:error];
                    return ;
                }
                EFUser *currentUser = [EFUser currentUser];
                currentUser.username = [NSString stringWithFormat:@"%@_新用户",self.userName.text];
                currentUser.password = self.pwd1.text;
                currentUser.type = type;
                [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        [SVProgressHUD dismiss];
                        [selfWeak alerWithTitle:@"注册成功，请返回登录页登录" Message:nil CallBack:^{
                            [selfWeak close:nil];
                        }];
                    }else{
                        [selfWeak toastWithError:error];
                        [currentUser deleteEventuallyWithBlock:^(id object, NSError *error) {
                            [SVProgressHUD dismiss];
                        }];
                    }
                }];
                
            }];
        }
    }];
}



/*!
 *  注册时选择角色
 */
- (void)registWithRoleWithBlock:(void(^)(int type))block{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择近的角色" preferredStyle:(UIAlertControllerStyleActionSheet)];
    [alert addAction:[UIAlertAction actionWithTitle:@"商家" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if (block != nil) {
            block(0);
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"用户" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if (block != nil) {
            block(1);
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        if (block != nil) {
            block(-1);
        }
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
