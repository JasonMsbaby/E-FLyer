//
//  PayInController.m
//  E-flyer
//
//  Created by 苗爽 on 16/4/24.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFLog.h"
#import "PayInController.h"

@interface PayInController ()
@property (weak, nonatomic) IBOutlet UITextField *money;
@property (weak, nonatomic) IBOutlet UIButton *btn_alipay;
@property (weak, nonatomic) IBOutlet UIButton *btn_weixinpay;
@property (weak, nonatomic) IBOutlet UIButton *btn_testpay;
@end

@implementation PayInController

- (void)viewDidLoad {
    [super viewDidLoad];
}
//支付宝支付
- (IBAction)btnAliPayAction:(id)sender {
    [SVProgressHUD showInfoWithStatus:@"测试中，暂未开通"];
}
//微信支付
- (IBAction)btnWeiXinPayAction:(id)sender {
    [SVProgressHUD showInfoWithStatus:@"测试中，暂未开通"];
}
//测试支付
- (IBAction)btnTestPayAction:(id)sender {
    if ([self.money.text isEqualToString:@""] || [self.money.text floatValue] <= 0) {
        [SVProgressHUD showErrorWithStatus:@"充值金额应大于0元"];
        return ;
    }
    [SVProgressHUD showInfoWithStatus:@"正在充值,请稍后..."];
    self.currentUser.money += [self.money.text floatValue];
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            //创建充值记录
            [EFLog saveLogWithType:(EFLogTypeIn) Source:kPayType_Test Money:[self.money.text floatValue] Good:nil Finish:^(BOOL success) {
                
                [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"充值成功,成功充入%.2lf元",[self.money.text floatValue]]];
                
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }else{
            [self toastWithError:error];
        }
    }];
}

@end
