//
//  HPFLResultViewController.m
//  House_Project
//
//  Created by lanou3g on 14-10-26.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HPFLResultViewController.h"
#import "resultUITextFiled.h"
@interface HPFLResultViewController ()

@end

@implementation HPFLResultViewController
- (void)dealloc
{
    [_HPFLArray release];
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
     NSString *str =[NSString stringWithFormat:@"－－基本信息:\n婚姻状况:%@,个人月缴存:%@,配偶月缴存:%@,房屋评估值（元）:%@,房屋面积（平米）:%@,按揭成数:%@,按揭年数:%@,贷款年利率分类:%@。\n计算结果：\n年利率（％）:%@,月供款额（元）:%@,可贷款数(评估值计算)（元）:%@,月还款(评估值计算)（元）:%@,可贷款数(月缴存计算)（元）:%@,月还款(月缴存计算)（元）:%@,可贷款数(最终值):%@,可贷款数(最终值):%@。",[self.inforArray objectAtIndex: 0],[self.inforArray objectAtIndex: 1],[self.inforArray objectAtIndex: 2],[self.inforArray objectAtIndex: 3],[self.inforArray objectAtIndex: 4],[self.inforArray objectAtIndex: 5],[self.inforArray objectAtIndex: 6],[self.inforArray objectAtIndex: 7],[self.HPFLArray objectAtIndex: 0],[self.HPFLArray objectAtIndex: 1],[self.HPFLArray objectAtIndex: 2],[self.HPFLArray objectAtIndex: 3],[self.HPFLArray objectAtIndex: 4],[self.HPFLArray objectAtIndex: 5],[self.HPFLArray objectAtIndex: 6],[self.HPFLArray objectAtIndex: 7]];
     NSLog(@"TEST:%@",str);
    
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
    /*
     //婚姻状况//个人月缴存//配偶月缴存//房屋评估值//房屋面积//按揭成数//按揭年数//贷款年利率
     
     //年利率//月供款额//可贷款数(评估值计算)//可贷款数（月缴存计算）//可贷款数(最终值)//月还款(评估值计算)//月还款（月缴存计算）//月还款最终值
     */
    //编辑短信发送的内容
    
    messagePicker.body = [NSString stringWithFormat:@"－－基本信息:\n婚姻状况:%@,个人月缴存:%@,配偶月缴存:%@,房屋评估值（元）:%@,房屋面积（平米）:%@,按揭成数:%@,按揭年数:%@,贷款年利率分类:%@。\n计算结果：\n年利率（％）:%@,月供款额（元）:%@,可贷款数(评估值计算)（元）:%@,月还款(评估值计算)（元）:%@,可贷款数(月缴存计算)（元）:%@,月还款(月缴存计算)（元）:%@,可贷款数(最终值):%@,可贷款数(最终值):%@。",[self.inforArray objectAtIndex: 0],[self.inforArray objectAtIndex: 1],[self.inforArray objectAtIndex: 2],[self.inforArray objectAtIndex: 3],[self.inforArray objectAtIndex: 4],[self.inforArray objectAtIndex: 5],[self.inforArray objectAtIndex: 6],[self.inforArray objectAtIndex: 7],[self.HPFLArray objectAtIndex: 0],[self.HPFLArray objectAtIndex: 1],[self.HPFLArray objectAtIndex: 2],[self.HPFLArray objectAtIndex: 3],[self.HPFLArray objectAtIndex: 4],[self.HPFLArray objectAtIndex: 5],[self.HPFLArray objectAtIndex: 6],[self.HPFLArray objectAtIndex: 7]];
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
    backGroundView.contentSize = CGSizeMake(300, 800);
    backGroundView.showsVerticalScrollIndicator = NO;
    backGroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:backGroundView];
    
    NSArray *listArray = [NSArray arrayWithObjects:@"年利率（%）",@"月供款额（元）",@"评估值可贷款数（元）",@"评估值月还款(元)",@"月缴存可贷款数（元）",@"月缴存月还款(元)",@"可贷款数（元）",@"月还款(元)",nil];
    //列表初始化
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(0, 5, 300, 40)];
    label.text = @"公积金贷款计算结果";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor colorWithRed:232/255.0 green:222/255.0 blue:153/255.0 alpha:1];
   
    [backGroundView addSubview:label];
    [label release];
    
    for (int i = 0; i < listArray.count; i++) {
        resultUITextFiled *taxResuleTF = [[resultUITextFiled  alloc] initWithFrame:CGRectMake(0, 45+i*40, 300, 40) andTaxTitle:[listArray objectAtIndex:i]];
        [backGroundView addSubview: taxResuleTF];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50+taxResuleTF.bounds.size.width/2, 45+i*40+taxResuleTF.bounds.size.height/5, taxResuleTF.bounds.size.width/3, taxResuleTF.bounds.size.height*3/5)];
        label.textAlignment = NSTextAlignmentLeft;
        label.layer.cornerRadius = 5.0;
        label.text = [self.HPFLArray objectAtIndex:i];
         label.textColor = [UIColor redColor];
        //属性设置
        label.adjustsFontSizeToFitWidth = YES;
        [backGroundView addSubview:label];
        [label release];
        [taxResuleTF release];
        
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
