//
//  BasicController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/27.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "App.h"
#import "BasicController.h"

@interface BasicController ()

@end

@implementation BasicController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.currentUser = [EFUser currentUser];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"BasicViewController");
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"left_back"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]style:(UIBarButtonItemStylePlain) target:self action:@selector(leftBarButtonItemBack:)];
}

- (void)leftBarButtonItemBack:(UIBarButtonItem *)item{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)alerWithTitle:(NSString *)title Message:(NSString *)message CallBack:(void (^)())callback{
    if (message == nil) {
        message = @"";
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action_ok = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if (callback != nil) {
            callback();
        }
    }];
    UIAlertAction *action_cancle = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    [alert addAction:action_ok];
    [alert addAction:action_cancle];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)toastWithError:(NSError *)err{
    NSString *c = [NSString stringWithFormat:@"code_%ld",err.code];
    App *app = [App sharedApp];
    NSString *e = app.kCode[c];
    if(e == nil){
        e = [NSString stringWithFormat:@"%ld-%@",err.code,err.userInfo[@"error"]];
    }
    [SVProgressHUD showErrorWithStatus:e];
}


@end
