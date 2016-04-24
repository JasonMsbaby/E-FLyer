//
//  PhoneChangeController.m
//  E-flyer
//
//  Created by 苗爽 on 16/4/23.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "LoginController.h"
#import "PhoneChangeController.h"
#import "NSTimer+EFTimer.h"
@interface PhoneChangeController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *btnValidCode;

@property (weak, nonatomic) IBOutlet UITextField *ValidCode;
@property(nonatomic,strong) NSTimer *timer;
@property(nonatomic,assign) int time_span;
@end

@implementation PhoneChangeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timer =[NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerInterval:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer pause];
    self.time_span = 60;
}

- (void)timerInterval:(NSTimer *)timer{
    [self.btnValidCode setTitle:[NSString stringWithFormat:@"%d",self.time_span] forState:(UIControlStateNormal)];
    if (self.time_span == 0) {
        [_btnValidCode setBackgroundColor:[UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000]];
        [self.btnValidCode setTitle:@"获取验证码" forState:(UIControlStateNormal)];
        [self.btnValidCode setEnabled:YES];
        self.time_span = kRegist_Time;
        [self.timer pause];
    }else{
        [_btnValidCode setBackgroundColor:[UIColor colorWithWhite:0.600 alpha:1.000]];
        [self.btnValidCode setEnabled:NO];
    }
    
    self.time_span--;
}

- (IBAction)btnValidCodeAction:(id)sender {
    if ([self.phoneNumber.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }
    if ([self.currentUser.mobilePhoneNumber isEqualToString:self.phoneNumber.text]) {
        [SVProgressHUD showErrorWithStatus:@"您输入的手机号与当前一致"];
        return;
    }
    [SVProgressHUD showWithStatus:@"正在发送验证码..."];
    [AVOSCloud requestSmsCodeWithPhoneNumber:self.phoneNumber.text
                                     appName:@"E-Flyer"
                                   operation:@"更改绑定手机"//您正在{某应用}中进行{具体操作名称}，您的验证码是:{123456}，请输入完整验证，有效期为:{10}分钟
                                  timeToLive:10
                                    callback:^(BOOL succeeded, NSError *error) {
                                        if(succeeded){
                                            [self.timer resume];
                                            [SVProgressHUD showInfoWithStatus:@"正在发送验证码,请查看您的手机"];
                                        }else{
                                            [self toastWithError:error];
                                        }
                                    }];
}

- (IBAction)btnSubmitAction:(id)sender {
    [SVProgressHUD showWithStatus:@"正在更改绑定,请稍后..."];
    [AVOSCloud verifySmsCode:self.ValidCode.text mobilePhoneNumber:self.phoneNumber.text callback:^(BOOL succeeded, NSError *error) {
        if(succeeded){
            //验证成功
            self.currentUser.mobilePhoneNumber = self.phoneNumber.text;
            [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    [SVProgressHUD showSuccessWithStatus:@"手机号码修改成功"];
                    LoginController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginController"];
                    loginVC.hidesBottomBarWhenPushed = YES;
                    [self presentViewController:loginVC animated:YES completion:nil];
                }else{
                    [self toastWithError:error];
                }
            }];
        }else{
            [self toastWithError:error];
        }
    }];
    
}

@end
