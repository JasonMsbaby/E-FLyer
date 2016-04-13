//
//  HomeAddInfoController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
//#import <CRMediaPickerController.h>
#import "CityViewController.h"
#import "EFCategroy.h"
#import "LrdDateModel.h"
#import "EFCrowd.h"
#import "LrdAlertTableView.h"
#import "HomeAddInfoController.h"
#import "SVProgressHUD.h"
#import <Photos/Photos.h>
#import "ToolUtils.h"
#import "EFBMKModel.h"
#import "ShowBMKMap.h"
//typedef void(^Result)(NSData *fileData, NSString *fileName);

@interface HomeAddInfoController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
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
@property(strong,nonatomic) UIImagePickerController *mediaVC;
@end


@implementation HomeAddInfoController

- (void)viewDidLoad{
    [super viewDidLoad];
    //    self.view.backgroundColor = kRandomColor;
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
        if (index == 0) {
            CityViewController *cityVC = [CityViewController new];
            WeakObj(self)
            cityVC.block = ^(NSInteger row,LrdDateModel *model){
                selfWeak.lbl_area.text = model.title;
            };
            [self presentViewController:cityVC animated:YES completion:nil];
        }else{
            ShowBMKMap *mapVC = [[ShowBMKMap alloc] init];
            mapVC.block = ^(EFBMKModel *model){
                self.lbl_area.text = [NSString stringWithFormat:@"%@【附近:%.2f公里】",model.address,model.scope/1000];
            };
            [[self navigationController] pushViewController:mapVC animated:YES];
        }
    }];
}
- (IBAction)btnAddFileClick:(id)sender {
    WeakObj(self)
    [self alerSheetWithTitle:@"添加图片/视频" Message:@"请选择添加方式" Buttons:@[@"本地选取图片/视频",@"照相/录像"] CallBack:^(NSInteger index) {
        _mediaVC = [[UIImagePickerController alloc]init];
        _mediaVC.delegate = self;
        if (index == 0) {
            [selfWeak initPhotoVideoSelect];
        }else{
            [selfWeak initCarmera];
        }
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
 *  是否推荐
 *
 *  @param sender sender description
 */
- (IBAction)btnSwitchChanged:(id)sender {
    
}

#pragma mark - 拍照或录像的帮助方法
- (void)initCarmera{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [_mediaVC setSourceType:UIImagePickerControllerSourceTypeCamera];// 设置类型
        // 设置所支持的类型，设置只能拍照，或则只能录像，或者两者都可以
        [_mediaVC setMediaTypes:@[@"public.movie",@"public.image"]];
        // 设置录制视频的质量
        [_mediaVC setVideoQuality:UIImagePickerControllerQualityTypeHigh];
        //设置最长摄像时间
        [_mediaVC setVideoMaximumDuration:10.f];
        [_mediaVC setAllowsEditing:YES];// 设置是否可以管理已经存在的图片或者视频
        [self presentViewController:_mediaVC animated:YES completion:nil];
    }else{
        [SVProgressHUD showErrorWithStatus:@"您的手机不支持相机"];
        return;
    }
}
- (void)initPhotoVideoSelect{
    _mediaVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [_mediaVC setMediaTypes:@[@"public.movie",@"public.image"]];
    [self presentViewController:_mediaVC animated:YES completion:nil];
}

#pragma mark - imagePickControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    WeakObj(self)
    NSLog(@"%@",info);
    [self dismissViewControllerAnimated:YES completion:^{
        if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:@"public.image"]) {
            UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
            [selfWeak.btn_addFile setImage:img forState:(UIControlStateNormal)];
        }else{
            UIImage *img = [ToolUtils thumbnailImageForVideo:[info objectForKey:UIImagePickerControllerMediaURL] atTime:0];
            [selfWeak.btn_addFile setImage:img forState:(UIControlStateNormal)];
        }
    }];
}
@end
