//
//  SMTPSenderViewController.m
//  DianYue
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 Andy__M. All rights reserved.
//

#import "SMTPSenderViewController.h"
#import <CFNetwork/CFNetwork.h>
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"


@interface SMTPSenderViewController ()
{
  
}

@end

@implementation SMTPSenderViewController
- (void)dealloc
{
    [_contentTF release];
    [_adressTextFiled release];
    [_activityIndicatorView release];
    [_baseView release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStyleBordered target:self action:@selector(sendEmail)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(cancle:)];
                self.navigationItem.title = @"意见反馈";
    }
    return self;
}
-(void)cancle:(UIBarButtonItem*)cancle
{
    [self.contentTF resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 发送邮件
- (void)sendEmail {
    if ([self.contentTF.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"亲，不能为空哦" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        return;
    }
	SKPSMTPMessage *testMsg = [[SKPSMTPMessage alloc] init];
	testMsg.fromEmail = @"dianyuenews@163.com";				//	发送者
	testMsg.toEmail = @"517855944@qq.com";					//	发送给
	testMsg.relayHost = @"smtp.163.com";					//	发送有些的发送服务器地址
	testMsg.requiresAuth = YES;								//	需要鉴权
	testMsg.login = @"dianyuenews@163.com";					//	发送者的登录账号
	testMsg.pass = @"bjs140729";							//	发送者的登录密码
	testMsg.subject = [NSString stringWithFormat:@"【意见反馈】"];		//邮件主题
	NSString * senderT = [NSString stringWithFormat:@"%@--邮箱%@", self.contentTF.text,self.adressTextFiled.text];
	testMsg.wantsSecure = YES;
	testMsg.delegate = self;
	NSDictionary * plainPart = [NSDictionary dictionaryWithObjectsAndKeys:
								@"text/plain",kSKPSMTPPartContentTypeKey,
								senderT,kSKPSMTPPartMessageKey,
								@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];				//主题
	testMsg.parts = [NSArray arrayWithObjects:plainPart, nil];
	[testMsg send];
    //解决
    self.navigationController.navigationBarHidden = YES;
    UIView * backView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.baseView = backView;
    backView.backgroundColor = [UIColor lightGrayColor];
    backView.alpha = 0.8;
    [self.view addSubview: backView ];
    //初始化:
    UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    self.activityIndicatorView= indicator;
    //设置显示样式,见UIActivityIndicatorViewStyle的定义
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    //设置显示位置
    [indicator setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2- 160)];
    //设置背景色
    indicator.backgroundColor = [UIColor lightGrayColor];
    //设置背景为圆角矩形
    indicator.layer.cornerRadius = 6;
    indicator.layer.masksToBounds = YES;
    [indicator startAnimating];
    [backView addSubview:indicator];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(110, 150, 100, 30)];
    label.text = @"正在发送,请稍后...";
    label.font= [UIFont systemFontOfSize:12];
    label.textColor= [UIColor whiteColor];
    [backView addSubview:label];
    [label release];
    [indicator release];
    [backView release];
    
}




- (void)messageSent:(SKPSMTPMessage *)message
{
    self.contentTF.text = @"";
    self.adressTextFiled.text = @"";
    [self.activityIndicatorView stopAnimating];
     self.navigationController.navigationBarHidden = NO;
    [self.baseView removeFromSuperview];
    [message release];
    NSLog(@"delegate - message sent");
    alert(@"意见反馈发送成功");
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
{
       self.contentTF.text = @"";
    self.adressTextFiled.text = @"";
     [self.activityIndicatorView stopAnimating];
     self.navigationController.navigationBarHidden = NO;
    [self.baseView removeFromSuperview];
    [message release];
    NSLog(@"delegate - error(%ld): %@", (long)[error code], [error localizedDescription]);
    alert(@"意见反馈发送失败");
}

void alert(NSString* msg)
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake(20, 80, 280, 150)];
    textFiled.borderStyle = UITextBorderStyleRoundedRect;
    textFiled.textColor = [UIColor grayColor];
    self.contentTF = textFiled;
    textFiled.placeholder = @"请提出您的宝贵的意见！";
    textFiled.adjustsFontSizeToFitWidth = YES;
    textFiled.delegate = self;
    [self.view addSubview:textFiled];
    [textFiled release];
    
    UITextField *adressTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(20, 250, 280, 40)];
    adressTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    adressTextFiled.textColor = [UIColor grayColor];
    self.adressTextFiled = textFiled;
    adressTextFiled.placeholder = @"为了及时反馈您的意见，请留下您的邮箱";
    adressTextFiled.adjustsFontSizeToFitWidth = YES;
    adressTextFiled.delegate = self;
    [self.view addSubview:adressTextFiled];
    [adressTextFiled release];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//收回键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(void) drawPlaceholderInRect:(CGRect)rect {
    [[UIColor grayColor] setFill];
}


@end
