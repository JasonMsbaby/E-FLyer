//
//  HouseTaxCalculationViewHomeController.m
//  House_Project
//
//  Created by lanou3g on 14-10-14.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HouseTaxCalculationViewHomeController.h"
#import "PortraitsView.h"
#import "UITextFieldAndUILabel.h"
#import "UITextFiledAndUILabelTwo.h"
#import "ResultViewController.h"
#import "HouseInforModel.h"
#import "DBManger.h"
#import "ResultHandler.h"
#import "HistoryTableViewController.h"

@interface HouseTaxCalculationViewHomeController ()

@end

@implementation HouseTaxCalculationViewHomeController

- (void)dealloc
{
    [_typeArray release];
    [_unitArray release];
    [_typeTwoArray release];
    [_houseTypeArray release];
    [_yearsArray release];
    [_numSellerArray release];
    [_numBuyerArray release];
    [_dkTypeArray release];
    [_presenArray release];
    [_optionArray release];
    [_backGroundView release];
    [_tf release];
    [_sellerHouseNumTF release];
    [_buyerHouseNumTF release];
    [_houseAreaTF release];
    [_pickerView release];
    [_pickerViewTwo release];
    [_pickerViewThree release];
    [_pickerViewFour release];
    [_pickerViewFive release];
    [_pickerViewSix release];
    [_optionTF release];
    [_optionTFTwo release];
    [_rootView release];
    [_costTF release];
    [_dkMoney release];
    [_dkType release];
    [_presen release];
    [_inforModel release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
          }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //清空
    self.tf.text = @"";
    self.basePrice.text = @"";
    self.houseAreaTF.text = @"";
    self.costTF.text= @"";
    self.sellerHouseNumTF.text = [self.numSellerArray objectAtIndex:0];
    self.optionTF.text = [self.houseTypeArray objectAtIndex:0];
    self.optionTFTwo.text = [self.yearsArray objectAtIndex:0];
    self.buyerHouseNumTF.text = [self.numBuyerArray objectAtIndex:0];
    self.dkType.text = [self.dkTypeArray objectAtIndex:0];
    self.dkMoney.text = @"";
    self.presen.text = [self.presenArray objectAtIndex:0];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //////////////////// //设置背景视图//////////////////////////////////////
    self.backGroundView = [[[UIScrollView alloc]initWithFrame:CGRectMake(10, 5, 300, [UIScreen mainScreen].bounds.size.height-49)]autorelease];
    self.backGroundView.contentSize = CGSizeMake(300, 900);
    //设置滑动图片
    self.backGroundView.showsVerticalScrollIndicator = NO;
    self.backGroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.backGroundView];
    
    //////////////////// ////添加手势，收回键盘//////////////////////////////////////
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keyboardReturn)];
    [self.backGroundView addGestureRecognizer:tapGR];
    [tapGR release];
    
    ////////////////////////////设置卖方头像/////////////////////////////////
    PortraitsView *sellerPortraitView = [[[PortraitsView alloc]initWithFrame:CGRectMake(0, 10, 300, 30) andUIImage:[UIImage imageNamed:@"houseWithPerson.png"]]autorelease];
    [self.backGroundView addSubview:sellerPortraitView];
    
    ////////////////////////信息////////////////////////////////////////
    //typeArray初始化
    self.typeArray = [[[NSArray alloc]initWithObjects:@"成交价(万元)",@"网签价（万元）",@"原值（万元）",@"所售住房面积/平米",@"现有住房(套)",@"所售住房性质",@"所售住房购买年限",nil]autorelease];
    self.typeTwoArray = [[[NSArray alloc]initWithObjects:@"现有住房(套)",@"贷款类型",@"贷款金额（万元）",@"中介服务费百分比",nil]autorelease];
    //房屋类型数组初始化
    self.houseTypeArray = [[[NSArray alloc]initWithObjects:@"优惠价住房",@"成本价住房",@"经济适用房",@"经济适用房管理",@"商品房", nil]autorelease];
    self.yearsArray = [[[NSArray alloc]initWithObjects:@"5年以下",@"5年以上",nil]autorelease];
    //现有住房套数数组初始化
    self.numSellerArray = [[NSArray alloc]initWithObjects:@"1", @"2",nil];
    //现有住房套数数组初始化
    self.numBuyerArray = [[NSArray alloc]initWithObjects:@"0", @"1",nil];
    //贷款类型
    self.dkTypeArray =[[NSArray alloc]initWithObjects:@"商贷",@"无",@"公积金贷款",nil];
    //中介服务费百分比
    self.presenArray = [[NSArray alloc]initWithObjects:@"2.2",@"2.7", nil];
    
    
    //model初始化
    self.inforModel = [[HouseInforModel alloc]init];
    ////////////////////////卖方信息////////////////////////////////////////
    int k = 0;
    //选择控件
    for (int j = 0; j < 7; j ++) {
        UITextFiledAndUILabelTwo *tfAndUILabelTwo = [[UITextFiledAndUILabelTwo alloc]initWithFrame:CGRectMake(0, 40+j*50, 300, 50) andOptionTitle:[self.typeArray objectAtIndex:j]];
        [self.backGroundView addSubview:tfAndUILabelTwo];
        tfAndUILabelTwo.borderStyle = UITextBorderStyleRoundedRect;
        if (j == 0) {
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 40+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-10, tfAndUILabelTwo.bounds.size.height-15)];
            self.tf = tf;
            tf.keyboardType = UIKeyboardTypeNumberPad;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            tf.clearsOnBeginEditing = YES;
            [self.backGroundView addSubview:tf];
            [tf release];
    
        }else if (j == 1){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 40+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-10, tfAndUILabelTwo.bounds.size.height-15)];
                       tf.keyboardType = UIKeyboardTypeNumberPad;
            self.basePrice = tf;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            tf.clearsOnBeginEditing = YES;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 2){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 40+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-10, tfAndUILabelTwo.bounds.size.height-15)];
                      self.costTF = tf;
            tf.keyboardType = UIKeyboardTypeNumberPad;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            tf.clearsOnBeginEditing = YES;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 3){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 40+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-10, tfAndUILabelTwo.bounds.size.height-15)];
             self.houseAreaTF = tf;
            tf.keyboardType = UIKeyboardTypeNumberPad;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            tf.clearsOnBeginEditing = YES;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 4){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 40+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-35, tfAndUILabelTwo.bounds.size.height-15)];
            self.sellerHouseNumTF = tf;
            tf.text = [self.numSellerArray objectAtIndex:0];
            tf.keyboardType = UIKeyboardTypeNumberPad;
            //属性设置
            tf.enabled = NO;
            tf.adjustsFontSizeToFitWidth = YES;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            tf.clearsOnBeginEditing = YES;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 5) {
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 40+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-35, tfAndUILabelTwo.bounds.size.height-15)];
            self.optionTF = tf;
            self.optionTF.font = [UIFont systemFontOfSize:14];
            tf.text = [self.houseTypeArray objectAtIndex:0];
            //属性设置
            tf.enabled = NO;
            tf.adjustsFontSizeToFitWidth = YES;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            tf.text = [self.houseTypeArray objectAtIndex:0];
            [self.backGroundView addSubview:tf];
            [tf release];
            
        }else if (j == 6){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 40+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-35, tfAndUILabelTwo.bounds.size.height-15)];
            self.optionTFTwo = tf;
            tf.text = [self.yearsArray objectAtIndex:0];
            //属性设置
            tf.enabled = NO;
            tf.adjustsFontSizeToFitWidth = YES;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            tf.text = [self.yearsArray objectAtIndex:0];
            [self.backGroundView addSubview:tf];
            [tf release];
        }
        if (j < 4) {
            
        }else{
            //创建UIButton
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(tfAndUILabelTwo.bounds.size.width/2+tfAndUILabelTwo.bounds.size.width/3+10, 36+j*50+tfAndUILabelTwo.bounds.size.height/5, 44,44);
            [btn setImage:[UIImage imageNamed:@"backLast"] forState:UIControlStateNormal];
            btn.tag = k++;
            [btn addTarget:self action:@selector(seleckClick:) forControlEvents:UIControlEventTouchUpInside];
            //添加视图
            tfAndUILabelTwo.borderStyle = UITextBorderStyleRoundedRect;
            [self.backGroundView addSubview:btn];
            [tfAndUILabelTwo release];
        }
    }
    
    
    //弹出视图
    self.rootView = [[[UIView alloc]initWithFrame:CGRectMake(0, 180, 320, 275)]autorelease];
    self.rootView.backgroundColor = [UIColor colorWithRed:232/255.0 green:233/255.0 blue:232/255.0 alpha:1];
    
    //UIButton
    UIButton *btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCancel.frame = CGRectMake(270, 3, 44, 44);
    btnCancel.layer.cornerRadius = 5.0;
    btnCancel.titleLabel.font = [UIFont systemFontOfSize:13];
    [btnCancel setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnCancel setTitle:@"完成" forState: UIControlStateNormal];
    btnCancel.backgroundColor = [UIColor whiteColor];
    [btnCancel addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.rootView addSubview:btnCancel];
    
    
    //设置选择器1
    self.pickerView = [[[UIPickerView alloc]initWithFrame:CGRectMake(10, 50, 300, 220)]autorelease];
    self.pickerView.layer.cornerRadius = 10;
    self.pickerView.backgroundColor = [UIColor whiteColor];
    //设置代理
    self.pickerView.delegate = self;
    //显示选中框
    self.pickerView.showsSelectionIndicator = YES;
    
    //设置选择器2
    self.pickerViewTwo = [[[UIPickerView alloc]initWithFrame:CGRectMake(10, 50, 300, 220)]autorelease];
    self.pickerViewTwo.layer.cornerRadius = 10;
    self.pickerViewTwo.backgroundColor = [UIColor whiteColor];
    //设置代理
    self.pickerViewTwo.delegate = self;
    //显示选中框
    self.pickerViewTwo.showsSelectionIndicator = YES;
    
    //设置选择器3
    self.pickerViewThree = [[[UIPickerView alloc]initWithFrame:CGRectMake(10, 50, 300, 220)]autorelease];
    self.pickerViewThree.layer.cornerRadius = 10;
    self.pickerViewThree.backgroundColor = [UIColor whiteColor];
    //设置代理
    self.pickerViewThree.delegate = self;
    //显示选中框
    self.pickerViewThree.showsSelectionIndicator = YES;
    
    //设置选择器4
    self.pickerViewFour = [[[UIPickerView alloc]initWithFrame:CGRectMake(10, 50, 300, 220)]autorelease];
    self.pickerViewFour.layer.cornerRadius = 10;
    self.pickerViewFour.backgroundColor = [UIColor whiteColor];
    //设置代理
    self.pickerViewFour.delegate = self;
    //显示选中框
    self.pickerViewFour.showsSelectionIndicator = YES;
    
    //设置选择器5
    self.pickerViewFive = [[[UIPickerView alloc]initWithFrame:CGRectMake(10, 50, 300, 220)]autorelease];
    self.pickerViewFive.layer.cornerRadius = 10;
    self.pickerViewFive.backgroundColor = [UIColor whiteColor];
    //设置代理
    self.pickerViewFive.delegate = self;
    //显示选中框
    self.pickerViewFive.showsSelectionIndicator = YES;
    
    //设置选择器6
    self.pickerViewSix = [[[UIPickerView alloc]initWithFrame:CGRectMake(10, 50 , 300, 220)]autorelease];
    self.pickerViewSix.layer.cornerRadius = 10;
    self.pickerViewSix.backgroundColor = [UIColor whiteColor];
    //设置代理
    self.pickerViewSix.delegate = self;
    //显示选中框
    self.pickerViewSix.showsSelectionIndicator = YES;
    
    
    ////////////////////////////设置买方头像/////////////////////////////////
    PortraitsView *buyerPortraitView = [[PortraitsView alloc]initWithFrame:CGRectMake(0, 400, 300, 30) andUIImage:[UIImage imageNamed:@"Rectangle 19 + single.png"]];
    [self.backGroundView addSubview:buyerPortraitView];
    [buyerPortraitView release];
    for (int i = 0; i < 4; i++) {
        //信息设置
        UITextFiledAndUILabelTwo *tfAndUILabelTwo = [[UITextFiledAndUILabelTwo alloc]initWithFrame:CGRectMake(0, 430 +i*50, 300, 50) andOptionTitle:[self.typeTwoArray objectAtIndex:i]];
        [self.backGroundView addSubview:tfAndUILabelTwo];
        tfAndUILabelTwo.borderStyle = UITextBorderStyleRoundedRect;
        if (i == 0) {
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 430 +i*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-35, tfAndUILabelTwo.bounds.size.height-15)];
            self.buyerHouseNumTF = tf;
            tf.text = [self.numBuyerArray objectAtIndex:0];
            tf.enabled = NO;
            tf.keyboardType = UIKeyboardTypeNumberPad;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (i == 1){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 430 +i*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-35, tfAndUILabelTwo.bounds.size.height-15)];
            self.dkType = tf;
            tf.text = [self.dkTypeArray objectAtIndex:0];
            tf.enabled = NO;
            tf.keyboardType = UIKeyboardTypeNumberPad;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            [self.backGroundView addSubview:tf];
            [tf release];
            
        }else if (i== 2){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2,430 +i*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-10, tfAndUILabelTwo.bounds.size.height-15)];
            self.dkMoney = tf;
            self.dkMoney.placeholder = @"请输入贷款金额";
            self.dkMoney.enabled = YES;
            tf.keyboardType = UIKeyboardTypeNumberPad;
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            tf.clearsOnBeginEditing = YES;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (i == 3){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 430 +i*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-35, tfAndUILabelTwo.bounds.size.height-15)];
            self.presen = tf;
            tf.text = [self.presenArray objectAtIndex:0];
            tf.enabled = NO;
            tf.keyboardType = UIKeyboardTypeNumberPad;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            [self.backGroundView addSubview:tf];
            [tf release];
            
        }if (i != 2 && i != 3) {
            UIButton *btnbuyer = [UIButton buttonWithType:UIButtonTypeCustom];
            btnbuyer.frame = CGRectMake(tfAndUILabelTwo.bounds.size.width/2+tfAndUILabelTwo.bounds.size.width/3+10, 425 +i*51+tfAndUILabelTwo.bounds.size.height/5, 44,44 );
            [btnbuyer setImage:[UIImage imageNamed:@"backLast"] forState:UIControlStateNormal];
            btnbuyer.tag = k++;
            [btnbuyer addTarget:self action:@selector(seleckClick:) forControlEvents:UIControlEventTouchUpInside];
            //添加视图
            [self.backGroundView addSubview:btnbuyer];
        }if (i == 3) {
            UIButton *btnbuyer = [UIButton buttonWithType:UIButtonTypeCustom];
            btnbuyer.frame = CGRectMake(tfAndUILabelTwo.bounds.size.width/2+tfAndUILabelTwo.bounds.size.width/3+10, 425 +i*51+tfAndUILabelTwo.bounds.size.height/5, 44,44 );
            [btnbuyer setImage:[UIImage imageNamed:@"backLast"] forState:UIControlStateNormal];
            btnbuyer.tag = k++;
            [btnbuyer addTarget:self action:@selector(seleckClick:) forControlEvents:UIControlEventTouchUpInside];
            //添加视图
            [self.backGroundView addSubview:btnbuyer];
        }
        
        [tfAndUILabelTwo release];
    }
    //计算
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 640, 300, 45);
    btn.backgroundColor = [UIColor colorWithRed:232/255.0 green:233/255.0 blue:232/255.0 alpha:1 ];
    btn.layer.cornerRadius = 5.0;
    [btn setTitle:@"计算" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(tax:) forControlEvents:UIControlEventTouchUpInside];
    [self.backGroundView addSubview:btn];
    
    
}
#pragma mark -- 计算历史
- (void)resultInfor:(UIBarButtonItem *)sender
{
    HistoryTableViewController *historyTVC = [[HistoryTableViewController alloc]init];
    UINavigationController *ngc = [[UINavigationController alloc]initWithRootViewController:historyTVC];
    ngc.navigationBar.translucent= NO;
    [self presentViewController:ngc animated:YES completion:nil];
    [historyTVC release];
    [ngc release];
  
}
#pragma mark -- 计算
-(void)tax:(UIBarButtonItem *)sender
{
    if ([self.tf.text isEqualToString:@""] || [self.houseAreaTF.text isEqualToString:@""]||[self.costTF.text isEqualToString:@""] ) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"小提示" message:@"数据不能为空哦" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }else{
        //获取inofrModel对象
        self.inforModel.sellerHouseNum = self.sellerHouseNumTF.text;
        self.inforModel.houseType = self.optionTF.text;
        self.inforModel.houseArea = self.houseAreaTF.text;
        self.inforModel.years = self.optionTFTwo.text;
        self.inforModel.price = self.tf.text;
        self.inforModel.buyerHouseNum = self.buyerHouseNumTF.text;
        self.inforModel.dkType = self.dkType.text;
        self.inforModel.cost = self.costTF.text;
        self.inforModel.present = self.presen.text;
        self.inforModel.basePrice = self.basePrice.text;
        //底价
        if ([self.inforModel.basePrice isEqualToString:@""]) {
            self.inforModel.basePrice = [NSString stringWithFormat:@"0"];
        }else{
            self.inforModel.basePrice = self.basePrice.text;
        }
        //贷款金额
        if ([self.inforModel.dkType isEqualToString:@"无"]) {
            self.inforModel.dkMoney = [NSString stringWithFormat:@"0"];
        }else{
            self.inforModel.dkMoney = self.dkMoney.text;
        }
        
        NSDate *currentDate = [NSDate dateWithTimeIntervalSinceNow:8*3600];
        self.inforModel.date = [NSString stringWithFormat:@"%@",currentDate];
        self.inforModel.date = [self.inforModel.date substringToIndex:19];
        //插入数据库
        [DBManger insertInforWithModel:self.inforModel];
        //调用方法获得计算后的数据
       ResultModel *resultModel =  [ResultHandler returnResultWithHouseInforModel:self.inforModel];
        //页面跳转，进入计算界面,并将结果传到结果界面
        ResultViewController *resultVC = [[ResultViewController alloc]init];
        /*
         #pragma mark -- 卖方信息
         //当前时间
         @property (nonatomic, copy)NSString *date;
         //卖方住房套数
         @property (nonatomic, copy)NSString *sellerHouseNum;
         //所售住房类型
         @property (nonatomic, copy)NSString *houseType;
         //所售住房面积
         @property (nonatomic, copy)NSString *houseArea;
         //所售住房购买年限
         @property (nonatomic, copy)NSString *years;
         //成交价
         @property (nonatomic, copy)NSString *price;
         //底价
         @property (nonatomic, copy)NSString *basePrice;
         //原值
         @property (nonatomic, copy)NSString *cost;
         
         #pragma mark -- 买方信息
         //买方住房套数
         @property (nonatomic, copy)NSString *buyerHouseNum;
         //贷款类型
         @property (nonatomic, copy)NSString *dkType;
         //贷款金额
         @property (nonatomic, copy)NSString *dkMoney;
         //中介服务费百分比
         @property (nonatomic, copy)NSString *present;
         */
        //房源基本信息：
        //卖方住房套数，所售住房类型，所售住房面积，所售住房购买年限，原值,买方住房套数,贷款类型,贷款金额.成交价,底价,中介服务费百分比
        resultVC.inforArray = [[NSMutableArray alloc]initWithObjects:self.inforModel.sellerHouseNum,self.inforModel.houseType,self.inforModel.houseArea,self.inforModel.years,self.inforModel.cost,self.inforModel.buyerHouseNum,self.inforModel.dkType,self.inforModel.dkMoney,self.inforModel.price,self.inforModel.basePrice,self.inforModel.present, nil];
        resultVC.labelArray = [[[NSMutableArray alloc]initWithObjects:resultModel.totalPrice, resultModel.cost,resultModel.transactionPrice,resultModel.basePrice,resultModel.deedTax,resultModel.individualIncomeTax,resultModel.businessTax,resultModel.landTransferringFees,resultModel.agencyFee,resultModel.transferFee,resultModel.renderedFee,resultModel.approvalFee,resultModel.loanFee,nil]autorelease];
        [self.navigationController pushViewController:resultVC animated:YES];
        [resultVC release];
        
    }
}
//添加视图
- (void)addViewWithNSArray:(NSArray *)array andPickerView:(UIPickerView *)pickerView
{
    if (self.optionArray != nil) {
        //先移除所有元素
        [self.optionArray removeAllObjects];
        //再添加元素
        [self.optionArray addObjectsFromArray:array];
    }else{
        //房屋类型数组
        self.optionArray = [[[NSMutableArray alloc]initWithArray:array]autorelease];
    }
    [self.rootView addSubview:pickerView];
    [self.view addSubview:self.rootView];
    
    
}
//弹出视图
- (void)seleckClick:(UIButton *)btn
{
    if (btn.tag == 0) {
        self.flag = 0;
        [self addViewWithNSArray:self.numSellerArray andPickerView:self.pickerViewThree];
    }else if(btn.tag == 1){
        self.flag = 1;
        [self addViewWithNSArray:self.houseTypeArray andPickerView:self.pickerView];
    }else if (btn.tag == 2 ){
        self.flag = 2;
        [self addViewWithNSArray:self.yearsArray andPickerView:self.pickerViewTwo];
    }else if (btn.tag == 3 ){
        self.flag = 3;
        [self addViewWithNSArray:self.numBuyerArray andPickerView:self.pickerViewFour];
    }else if (btn.tag == 4 ){
        self.flag = 4;
        [self addViewWithNSArray:self.dkTypeArray andPickerView:self.pickerViewFive];
    }else if (btn.tag == 5 ){
        self.flag = 5;
        [self addViewWithNSArray:self.presenArray andPickerView:self.pickerViewSix];
    }
    
}
//收回视图
- (void)cancelClick:(UIButton *)btn
{
    [self.rootView removeFromSuperview];
}
#pragma mark-- 处理方法
//设置列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//设置当前列显示的行数
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (self.flag == 0) {
        return self.numSellerArray.count;
    }else if(self.flag == 1){
        return self.houseTypeArray.count;
    }else if(self.flag == 2){
        return self.yearsArray.count;
    }else if(self.flag == 3){
        return self.numBuyerArray.count;
    }else if(self.flag == 4){
        return self.dkTypeArray.count;
    }else {
        return self.presenArray.count;
    }
    
}

//设置当前行显示的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.optionArray objectAtIndex:row];
}
//被选中时，将UILabel的text显示选项内容
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (self.optionArray.count == 5) {
        self.optionTF.text = [self.optionArray objectAtIndex:row];
    }else if([[self.optionArray objectAtIndex:0]isEqualToString:@"0"]){
        self.buyerHouseNumTF.text = [self.optionArray objectAtIndex:row];
    }else if([[self.optionArray objectAtIndex:0] isEqualToString:@"1" ]){
        self.sellerHouseNumTF.text = [self.optionArray objectAtIndex:row];
    }else if([[self.optionArray objectAtIndex:0]isEqualToString:@"商贷"]){
        self.dkType.text = [self.optionArray objectAtIndex:row];
        if ([self.dkType.text isEqualToString:@"无"]) {
            self.dkType.enabled = NO;
            self.dkMoney.text = @"0";
        }else{
            self.dkType.enabled = YES;
            self.dkMoney.text = @"";
        }
    }else if([[self.optionArray objectAtIndex:0] isEqualToString:@"2.2" ]){
        self.presen.text = [self.optionArray objectAtIndex:row];
    }else{
        self.optionTFTwo.text = [self.optionArray objectAtIndex:row];
    }
}
//键盘回收
- (void)keyboardReturn
{
    [self.tf resignFirstResponder];
    [self.costTF resignFirstResponder];
    [self.houseAreaTF resignFirstResponder];
    [self.dkMoney resignFirstResponder];
    [self.basePrice resignFirstResponder];
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
