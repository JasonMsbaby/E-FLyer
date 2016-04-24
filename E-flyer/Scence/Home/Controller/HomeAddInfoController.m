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
#import "LrdPasswordAlertView.h"
#import "ShowBMKMap.h"
#import "EFGood.h"
#import "EFLog.h"
//typedef void(^Result)(NSData *fileData, NSString *fileName);

@interface HomeAddInfoController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,UITextViewDelegate>
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
@property(strong,nonatomic) UIImagePickerController *mediaVC;
@property(strong,nonatomic) EFGood *good;
@end


@implementation HomeAddInfoController

- (void)viewDidLoad{
    [super viewDidLoad];
    //    self.view.backgroundColor = kRandomColor;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"down_close"] style:(UIBarButtonItemStyleDone) target:self action:@selector(leftBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"share"] style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBarButtonItemClick:)];
    self.txt_price.delegate = self;
    self.txt_number.delegate = self;
    self.txt_content.delegate = self;
    [self initGood];
}

- (void)initGood{
    self.good = [EFGood object];
    self.good.blongUser = self.currentUser;
    self.good.crowd = [EFCrowd shareInstance].data[0];
    self.good.categroy = [EFCategroy shareInstance].data[0];
    self.good.recommend = NO;
    self.good.address = [EFBMKModel ChinaArea];
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
        selfWeak.good.crowd = [EFCrowd shareInstance].data[row];
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
        selfWeak.good.categroy = [EFCategroy shareInstance].data[row];
    };
    [dropDown_categroy pop];
}
/*!
 *  选择区域
 *
 *  @param sender sender description
 */
- (IBAction)btnAreaClick:(id)sender {
    ShowBMKMap *mapVC = [[ShowBMKMap alloc] init];
    WeakObj(self)
    mapVC.block = ^(EFBMKModel *model){
        NSString *area = [NSString stringWithFormat:@"%@【附近:%.2f公里】",model.address,model.scope/1000];
        [selfWeak.btn_selectArea setTitle:area forState:(UIControlStateNormal)];
        selfWeak.good.address = model;
        selfWeak.good.location = [AVGeoPoint geoPointWithLatitude:model.lat longitude:model.lng];
        selfWeak.good.scope = model.scope/1000;
    };
    [[self navigationController] pushViewController:mapVC animated:YES];
    
    //    [self alerSheetWithTitle:@"选择方式" Message:@"请选择添加区域的方式" Buttons:@[@"通过城市选择",@"通过地图选点"] CallBack:^(NSInteger index) {
    //        if (index == 0) {
    //            CityViewController *cityVC = [CityViewController new];
    //            WeakObj(self)
    //            cityVC.block = ^(NSInteger row,LrdDateModel *model){
    //                selfWeak.btn_selectArea.text = model.title;
    //            };
    //            [self presentViewController:cityVC animated:YES completion:nil];
    //        }else{
    //            ShowBMKMap *mapVC = [[ShowBMKMap alloc] init];
    //            mapVC.block = ^(EFBMKModel *model){
    //                self.lbl_area.text = [NSString stringWithFormat:@"%@【附近:%.2f公里】",model.address,model.scope/1000];
    //            };
    //            [[self navigationController] pushViewController:mapVC animated:YES];
    //        }
    //    }];
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
    if ([self checkInfo]) {
        [self alerSheetWithTitle:@"支付" Message:@"请选择支付类型" Buttons:@[@"支付宝支付",@"余额支付"] CallBack:^(NSInteger index) {
            switch (index) {
                case 0://支付宝支付
                    [self payWithAliPay];
                    break;
                case 1:
                    [self payWithMoney];
                    break;
                default:
                    break;
            }
        }];
    }
}
//支付宝支付
- (void)payWithAliPay{
    
}
//余额支付
- (void)payWithMoney{
    WeakObj(self)
    if (self.currentUser == nil) {
        [self alerWithTitle:@"提示" Message:@"您未登录,是否跳转到登录页面" CallBack:^{
            [selfWeak.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"LoginController"] animated:YES];
        }];
        return;
    }
    if ([self.subMoney.text floatValue]>self.currentUser.money) {
        [SVProgressHUD showErrorWithStatus:@"账户余额不足,请充值后再支付"];
    }else{
        [SVProgressHUD showWithStatus:@"正在发布,请稍后.由于图片较大,上传缓慢,请耐心等候..."];
        [self.good saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
#warning 此处扣除金额应该做线程处理
                self.currentUser.money = self.currentUser.money - [self.subMoney.text floatValue];
                [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        [SVProgressHUD showInfoWithStatus:@"发布成功"];
                        EFLog *log = [EFLog object];
                        log.user = self.currentUser;
                        log.money = [self.subMoney.text floatValue];
                        log.type = EFLogTypePublish;
                        log.good = self.good;
                        [log saveInBackground];
                        [selfWeak dismissViewControllerAnimated:YES completion:nil];
                    }else{
                        [self toastWithError:error];
                    }
                }];
            }else{
                [self toastWithError:error];
            }
        }];
    }
}

- (BOOL)checkInfo{
    self.good.title = self.txt_title.text;
    self.good.content = self.txt_content.text;
    self.good.question = self.txt_question.text;
    self.good.answer = self.txt_answer.text;
    self.good.blongUser = self.currentUser;
    
    if (_good.title == nil || [_good.title isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"标题不能为空"];
        return NO;
    }
    if (_good.img == nil && _good.video == nil) {
        [SVProgressHUD showErrorWithStatus:@"请选择图片或视频"];
        return NO;
    }
    if (_good.price == 0) {
        [SVProgressHUD showErrorWithStatus:@"单价不能为0"];
        return NO;
    }
    if (_good.count == 0) {
        [SVProgressHUD showErrorWithStatus:@"数量不能为0"];
        return NO;
    }
    return YES;
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
        if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:@"public.image"]) {//图片
            UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
            [selfWeak.btn_addFile setImage:img forState:(UIControlStateNormal)];
            selfWeak.good.img = [ToolUtils dataWithImage:img VideoPath:nil];
        }else{//视频
            UIImage *img = [ToolUtils thumbnailImageForVideo:[info objectForKey:UIImagePickerControllerMediaURL] atTime:0];
            [selfWeak.btn_addFile setImage:img forState:(UIControlStateNormal)];
            NSString *videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
            selfWeak.good.video = [ToolUtils dataWithImage:nil VideoPath:videoURL];
        }
    }];
}

#pragma mark - 文本框代理 用于计算当前应支付的金额
- (void)textFieldDidEndEditing:(UITextField *)textField{
    float price = [self.txt_price.text floatValue];
    float number = [self.txt_number.text intValue];
    self.good.price = price;
    self.good.count = number;
    self.good.receivedCount = 0;
    self.subMoney.text = [NSString stringWithFormat:@"%.2f",price*number];
}
#pragma mark - textViewDelegate 
-(void)textViewDidBeginEditing:(UITextView *)textView{
    if (![textView.textColor isEqual:[UIColor blackColor]]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"请输入描述内容";
        [textView setTextColor:[UIColor colorWithWhite:0.498 alpha:1.000]];
    }
}
@end
