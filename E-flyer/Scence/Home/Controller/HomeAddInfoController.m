//
//  HomeAddInfoController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "LrdAlertTableView.h"
#import "HomeAddInfoController.h"
#import "SVProgressHUD.h"

@interface HomeAddInfoController ()
@property (weak, nonatomic) IBOutlet UILabel *subMoney;//总计金额
@property (weak, nonatomic) IBOutlet UIButton *btn_pay;//支付按钮
@property (weak, nonatomic) IBOutlet UITextField *txt_title;//标题
@property (weak, nonatomic) IBOutlet UITextView *txt_content;//内容
@property (weak, nonatomic) IBOutlet UIButton *btn_addFile;//添加图片或者视频
@property (weak, nonatomic) IBOutlet UITextField *txt_question;//问题
@property (weak, nonatomic) IBOutlet UITextField *txt_answer;//答案
@property (weak, nonatomic) IBOutlet UITextField *txt_price;//单价
@property (weak, nonatomic) IBOutlet UITextField *txt_number;//数量
@property (weak, nonatomic) IBOutlet UISwitch *switch_isUp;//是否推荐
@property (weak, nonatomic) IBOutlet UIView *dropBaseView;//下拉菜单的占位view


@end


@implementation HomeAddInfoController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"down_close"] style:(UIBarButtonItemStyleDone) target:self action:@selector(leftBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"share"] style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBarButtonItemClick:)];
    [self layoutDropDownView];
}
/*!
 *  添加 针对人群 针对城市 所属类别进行添加下拉菜单
 */
- (void)layoutDropDownView{
    
}


#pragma mark - 导航栏两侧按钮点击事件
- (void)leftBarButtonItemClick:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)rightBarButtonItemClick:(UIBarButtonItem *)sender{
    [SVProgressHUD showInfoWithStatus:@"分享"];
}



#pragma mark - 其他控件事件处理


@end
