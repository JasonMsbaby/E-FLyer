//
//  HomeAddInfoController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFCategroy.h"
#import "LrdDateModel.h"
#import "EFCrowd.h"
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
@property (weak, nonatomic) IBOutlet UIButton *btn_selectPerson;//选取人群
@property (weak, nonatomic) IBOutlet UIButton *btn_selectCategroy;//选择分类
@property (weak, nonatomic) IBOutlet UIButton *btn_selectArea;//选择地区
@property (weak, nonatomic) IBOutlet UILabel *lbl_area;//选择之后的地区展示控件

@end


@implementation HomeAddInfoController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"down_close"] style:(UIBarButtonItemStyleDone) target:self action:@selector(leftBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"share"] style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBarButtonItemClick:)];
}



#pragma mark - 导航栏两侧按钮点击事件
- (void)leftBarButtonItemClick:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)rightBarButtonItemClick:(UIBarButtonItem *)sender{
    [SVProgressHUD showInfoWithStatus:@"分享"];
}


#pragma mark - 其他控件事件处理

/*!
 *  选择人群
 *
 *  @param sender sender description
 */
- (IBAction)btnPersonClick:(id)sender {
    LrdAlertTableView *dropDown_person = [[LrdAlertTableView alloc] initWithTitle:@"选择人群" SubTitle:nil];
    NSMutableArray *arr = [NSMutableArray array];
    for (EFCrowd *crowd in [EFCrowd shareInstance].data) {
        LrdDateModel *model = [[LrdDateModel alloc] initWithTitle:crowd.job];
        [arr addObject:model];
    }
    dropDown_person.dataArray = [NSMutableArray arrayWithArray:arr];
    WeakObj(self)
    dropDown_person.block = ^(NSInteger row,LrdDateModel *model){
        [selfWeak.btn_selectPerson setTitle:model.title forState:(UIControlStateNormal)];
    };
    [dropDown_person pop];
    
}
/*!
 *  选择类别
 *
 *  @param sender sender description
 */
- (IBAction)btnCategroyClick:(id)sender {
    LrdAlertTableView *dropDown_categroy = [[LrdAlertTableView alloc] initWithTitle:@"选择类别" SubTitle:nil];
    NSMutableArray *arr = [NSMutableArray array];
    for (EFCategroy *categroy in [EFCategroy shareInstance].data) {
        LrdDateModel *model = [[LrdDateModel alloc] initWithTitle:categroy.name];
        [arr addObject:model];
    }
    dropDown_categroy.dataArray = [NSMutableArray arrayWithArray:arr];
    WeakObj(self)
    dropDown_categroy.block = ^(NSInteger row,LrdDateModel *model){
        [selfWeak.btn_selectCategroy setTitle:model.title forState:(UIControlStateNormal)];
    };
    [dropDown_categroy pop];
}
/*!
 *  选择区域
 *
 *  @param sender sender description
 */
- (IBAction)btnAreaClick:(id)sender {
    [self alerSheetWithTitle:@"选择方式" Message:@"请选择添加区域的方式" Buttons:@[@"通过城市选择",@"通过地图选点"] CallBack:^(NSInteger index) {
        NSLog(@"%ld",index);
    }];
}
/*!
 *  支付
 *
 *  @param sender sender description
 */
- (IBAction)btnPayClick:(id)sender {
}
/*!
 *  添加图片或视频
 *
 *  @param sender sender description
 */
- (IBAction)btnFileClick:(id)sender {
}
/*!
 *  是否推荐
 *
 *  @param sender sender description
 */
- (IBAction)btnSwitchChanged:(id)sender {
}

#pragma mark - LrdAlertTableDataSources




@end
