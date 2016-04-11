//
//  ResultViewController.m
//  House_Project
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "ResultViewController.h"
#import "resultUITextFiled.h"

#import "HouseTaxCalculationViewHomeController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController
-(void)dealloc
{
    [_taxArray release];
    [_labelArray release];
    [super dealloc];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //发送邮件
        UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"message.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(senderMessage:)];
        self.navigationItem.rightBarButtonItem = right;
        [right release];
    }
    return self;
}
- (void)senderMessage:(UIBarButtonItem *)sender
{
    //测试
    /*
    NSString *str = [NSString stringWithFormat:@"－－房源基本信息:\n卖方信息：\n卖方住房套数:%@,所售住房类型:%@,所售住房面积:%@,所售住房购买年限:%@,原值:%@。\n买方信息：\n买方住房套数:%@,贷款类型:%@,贷款金额:%@。\n成交价:%@,底价:%@,中介服务费百分比:%@。\n－－＝税费如下:\n房税总价(元):%@,契税(元):%@,个税(元):%@,营业税(元):%@,土地出让金(元):%@,中介服务费(元):%@,代办过户(元):%@,代办交验(元):%@,代办审批(元):%@,贷款代办费(元):%@",[self.inforArray objectAtIndex: 0],[self.inforArray objectAtIndex: 1],[self.inforArray objectAtIndex: 2],[self.inforArray objectAtIndex: 3],[self.inforArray objectAtIndex: 4],[self.inforArray objectAtIndex: 5],[self.inforArray objectAtIndex: 6],[self.inforArray objectAtIndex: 7],[self.inforArray objectAtIndex: 8],[self.inforArray objectAtIndex: 9],[self.inforArray objectAtIndex: 10],[self.labelArray objectAtIndex: 0],[self.labelArray objectAtIndex: 4],[self.labelArray objectAtIndex: 5],[self.labelArray objectAtIndex: 6],[self.labelArray objectAtIndex: 7],[self.labelArray objectAtIndex: 8],[self.labelArray objectAtIndex: 9],[self.labelArray objectAtIndex: 10],[self.labelArray objectAtIndex: 11],[self.labelArray objectAtIndex: 12]];
    NSLog(@"TEST:%@",str);
     */
    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
    if (messageClass != nil) {
        // 首先检查当前设备是否支持短信发送功能
        if ([messageClass canSendText]) {
            [self displaySMSComposerSheet];
        }else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"当前设备不支持发送短信功能" message:nil delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles: nil];
            [alertView show];
        }
    }

}
#pragma mark ------ 发送短信 ------
- (void)displaySMSComposerSheet
{
    MFMessageComposeViewController *messagePicker = [[MFMessageComposeViewController alloc] init];
    messagePicker.messageComposeDelegate = self; // 设置messagePicker为self,用来监控短信发送状态
    //房源基本信息：
    //卖方住房套数，所售住房类型，所售住房面积，所售住房购买年限，原值,买方住房套数,贷款类型,贷款金额.成交价,底价,中介服务费百分比
    //编辑短信发送的内容
    
    messagePicker.body = [NSString stringWithFormat:@"－－房源基本信息:\n卖方信息：\n卖方住房套数:%@,所售住房类型:%@,所售住房面积:%@,所售住房购买年限:%@,原值:%@。\n买方信息：\n买方住房套数:%@,贷款类型:%@,贷款金额:%@。\n成交价:%@,底价:%@,中介服务费百分比:%@。\n－－＝税费如下:\n房税总价(元):%@\n,契税(元):%@,个税(元):%@,营业税(元):%@,土地出让金(元):%@,中介服务费(元):%@,代办过户(元):%@,代办交验(元):%@,代办审批(元):%@,贷款代办费(元):%@",[self.inforArray objectAtIndex: 0],[self.inforArray objectAtIndex: 1],[self.inforArray objectAtIndex: 2],[self.inforArray objectAtIndex: 3],[self.inforArray objectAtIndex: 4],[self.inforArray objectAtIndex: 5],[self.inforArray objectAtIndex: 6],[self.inforArray objectAtIndex: 7],[self.inforArray objectAtIndex: 8],[self.inforArray objectAtIndex: 9],[self.inforArray objectAtIndex: 10],[self.labelArray objectAtIndex: 0],[self.labelArray objectAtIndex: 4],[self.labelArray objectAtIndex: 5],[self.labelArray objectAtIndex: 6],[self.labelArray objectAtIndex: 7],[self.labelArray objectAtIndex: 8],[self.labelArray objectAtIndex: 9],[self.labelArray objectAtIndex: 10],[self.labelArray objectAtIndex: 11],[self.labelArray objectAtIndex: 12]];
    [self presentViewController:messagePicker animated:YES completion:^{
        
    }];
}

#pragma mark ------ MFMessageComposeViewControllerDelegate ------
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultCancelled:
        {
            NSLog(@"取消短信发送");
            break;
        }
        case MessageComposeResultSent:
        {
            NSLog(@"短信发送成功");
            break;
        }
        case MessageComposeResultFailed:
        {
            NSLog(@"信息发送失败");
            break;
        }
        default:
        {
            NSLog(@"信息未发送");
            break;
        }
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //////////////////// //设置背景视图//////////////////////////////////////
    UIScrollView *backGroundView = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 0, 300, 430)];
    backGroundView.contentSize = CGSizeMake(300, 610);
    backGroundView.showsVerticalScrollIndicator = NO;
    backGroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:backGroundView];
    //数组
    self.taxArray = [[[NSArray alloc]initWithObjects:@"房税总价(元)",@"原值(万元)",@"成交价(万元)",@"网签价(万元)",@"契税(元)",@"个税(元)",@"营业税(元)",@"土地出让金(元)",@"中介服务费(元)",@"代办过户(元)",@"代办交验(元)",@"代办审批(元)",@"贷款代办费(元)", nil]autorelease];
    //数组
    //列表初始化
    for (int i = 0; i < 13; i++) {
        resultUITextFiled *taxResuleTF = [[resultUITextFiled  alloc] initWithFrame:CGRectMake(0, 5+i*40, 300, 40) andTaxTitle:[self.taxArray objectAtIndex:i]];
        
        [backGroundView addSubview: taxResuleTF];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50+taxResuleTF.bounds.size.width/2, 5+i*40+taxResuleTF.bounds.size.height/5, taxResuleTF.bounds.size.width/3, taxResuleTF.bounds.size.height*3/5)];
        label.textAlignment = NSTextAlignmentLeft;
        label.layer.cornerRadius = 5.0;
        label.text = [self.labelArray objectAtIndex:i];
            //属性设置
        label.adjustsFontSizeToFitWidth = YES;
        [backGroundView addSubview:label];
        [label release];
        [taxResuleTF release];
        if (i == 0) {
            taxResuleTF.backgroundColor = [UIColor colorWithRed:232/255.0 green:222/255.0 blue:153/255.0 alpha:1];
            label.backgroundColor = [UIColor colorWithRed:232/255.0 green:222/255.0 blue:153/255.0 alpha:1];
            label.textColor = [UIColor redColor];
        }
    }
    [backGroundView release];

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
