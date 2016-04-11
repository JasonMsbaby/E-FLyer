//
//  EmailViewController.m
//  House_Project
//
//  Created by lanou3g on 14-11-6.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()

@end

@implementation EmailViewController
- (void)dealloc
{
    [_contentTF release];
    [_adressTextFiled release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"意见反馈";
        UIBarButtonItem *senderBBI = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStyleBordered target:self action:@selector(displayMailComposerSheet)];
        self.navigationItem.rightBarButtonItem = senderBBI;
        [senderBBI release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake(20, 10, 280, 150)];
    textFiled.borderStyle = UITextBorderStyleRoundedRect;
    textFiled.textColor = [UIColor grayColor];
    self.contentTF = textFiled;
    textFiled.placeholder = @"请您提出宝贵的意见！";
    textFiled.adjustsFontSizeToFitWidth = YES;
    textFiled.delegate = self;
    [self.view addSubview:textFiled];
    [textFiled release];
    
    UITextField *adressTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(20, 170, 280, 40)];
    adressTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    adressTextFiled.textColor = [UIColor grayColor];
    self.adressTextFiled = textFiled;
    adressTextFiled.placeholder = @"为了及时反馈您的意见，请留下您的邮箱";
    adressTextFiled.adjustsFontSizeToFitWidth = YES;
    adressTextFiled.delegate = self;
    [self.view addSubview:adressTextFiled];
    [adressTextFiled release];

    // Do any additional setup after loading the view.
}
//收回键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)sendEmail:(UIBarButtonItem *)sender
{
    Class mailCalss = (NSClassFromString(@"MFMailComposeViewController"));
    if (mailCalss != nil) {
        // 首先检查当前设备支持邮件发送功能
        if ([mailCalss canSendMail]) {
            [self displayMailComposerSheet];
        }else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"当前设备不支持发送邮件功能" message:nil delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles: nil];
            [alertView show];
        }
    }

}

#pragma mark ------ 发送邮件 ------
- (void)displayMailComposerSheet
{
    if ([self.contentTF.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"亲，不能为空哦" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        return;
    }
    MFMailComposeViewController *emailPicker = [[MFMailComposeViewController alloc] init];
    emailPicker.mailComposeDelegate = self; // 设置emailPicker的代理为self
    [emailPicker setSubject:@"意见反馈"]; // 设置邮件正文
    // 设置收件人
    NSArray *toRecipients = @[@"517855944@qq.com"];
    [emailPicker setToRecipients:toRecipients]; // 设置收件人
    // 邮件正文
    NSString *emailBody = [NSString stringWithFormat:@"%@邮箱%@",self.contentTF.text,self.adressTextFiled.text];
    [emailPicker setMessageBody:emailBody isHTML:NO];
    
    [self presentViewController:emailPicker animated:YES completion:^{
    }];
}
#pragma mark ------ MFMailComposeViewControllerDelegate ------
#pragma mark -- 发送状态
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultCancelled:
        {
            NSLog(@"取消邮件发送");
            break;
        }
        case MFMailComposeResultSaved:
        {
            NSLog(@"保存邮件成功");
            break;
        }
        case MFMailComposeResultSent:
        {
            NSLog(@"邮件发送成功");
            break;
        }
        case MFMailComposeResultFailed:
        {
            NSLog(@"邮件发送失败");
            break;
        }
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
