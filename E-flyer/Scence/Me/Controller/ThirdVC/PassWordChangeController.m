//
//  PassWordChangeController.m
//  E-flyer
//
//  Created by 苗爽 on 16/4/23.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "LoginController.h"
#import "PassWordChangeController.h"

@interface PassWordChangeController ()
@property (weak, nonatomic) IBOutlet UITextField *oldPassWord;
@property (weak, nonatomic) IBOutlet UITextField *passWord1;
@property (weak, nonatomic) IBOutlet UITextField *passWord2;

@end

@implementation PassWordChangeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//提交修改
- (IBAction)btnSubmit:(id)sender {
    if ([self.passWord1.text isEqualToString:@""] || [self.passWord2.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"密码不能为空"];
        return;
    }
    if (![self.passWord1.text isEqualToString:self.passWord2.text]) {
        [SVProgressHUD showErrorWithStatus:@"两次密码不一致"];
        return;
    }
    [SVProgressHUD showWithStatus:@"正在修改..."];
    [self.currentUser updatePassword:self.oldPassWord.text newPassword:self.passWord1.text block:^(id object, NSError *error) {
        if (!error) {
            [SVProgressHUD showSuccessWithStatus:@"修改成功,请重新登录"];
            [EFUser logOut];//修改成功 注销登录  调回登录页面
            LoginController *loginController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginController"];
            loginController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:loginController animated:YES];
        }else{
            [self toastWithError:error];
        }
    }];
}

@end
