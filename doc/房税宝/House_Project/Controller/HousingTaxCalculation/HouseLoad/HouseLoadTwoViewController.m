//
//  HouseLoadTwoViewController.m
//  House_Project
//
//  Created by lanou3g on 14-11-12.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HouseLoadTwoViewController.h"
#import "UITextFiledAndUILabelTwo.h"
#import "HPFLoadModel.h"
#import "DBManger.h"
#import "HPFLHandler.h"
#import "HPFLResultViewController.h"
@interface HouseLoadTwoViewController ()

@end

@implementation HouseLoadTwoViewController
- (void)dealloc
{
    [_backGroundView release];
    [_rootView release];
    [_pickerViewFive release];
    [_pickerViewFour release];
    [_pickerViewSix release];
    [_percentageTwoArray release];
    [_marriageArray release];
    [_optionArray release];
    [_yearsArray release];
    [_MarriageTF release];
    [_personalTF release];
    [_spouseTF release];
    [_assessValueTwoTF release];
    [_houseAreaTwoTF release];
    [_percentageTwoTF release];
    [_yeorTwoTF release];
    [_APRTwoTF release];

    [super dealloc];
}
//清空
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.MarriageTF.text = [self.marriageArray objectAtIndex:0];
    self.personalTF.text = @"";
    self.spouseTF.text = @"";
    self.assessValueTwoTF.text = @"";
    self.houseAreaTwoTF.text = @"";
    self.percentageTwoTF.text = [self.percentageTwoArray objectAtIndex:0];
    self.yeorTwoTF.text = [self.yearsArray objectAtIndex:0];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //基本视图
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 5, 300, 450)];
    scrollView.contentSize = CGSizeMake(300, 700);
    self.backGroundView = scrollView;
    [self.view addSubview:scrollView];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keyboardReturn)];
    [scrollView addGestureRecognizer:tapGR];
    [tapGR release];
    
    //还款方式
    UITextField *textFieldTwo = [[UITextField alloc]initWithFrame:CGRectMake(0, 10, 300, 50)];
    textFieldTwo.borderStyle = UITextBorderStyleRoundedRect;
    textFieldTwo.enabled = NO;
    //标题
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 300, 30)];
    label.text = @"还款方式：   等额本息";
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:12];
    [textFieldTwo addSubview:label];
    [label release];
    //副标题
    UILabel *labelTwo = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 300, 20)];
    labelTwo.text = @"等额本息还款额每月相等";
    labelTwo.textColor = [UIColor lightGrayColor];
    labelTwo.textAlignment = NSTextAlignmentLeft;
    labelTwo.font = [UIFont systemFontOfSize:10];
    [textFieldTwo addSubview:labelTwo];
    [labelTwo release];
    //添加视图
    [scrollView addSubview:textFieldTwo];
    [textFieldTwo release];
    //数据源
    NSArray *listArray = [NSArray arrayWithObjects:@"婚姻状况",@"个人月缴存额",@"配偶月缴存额",@"房屋评估值(元)",@"房屋面积（平米）",@"按揭成数",@"按揭年数",@"年贷款利率分类",nil];
     self.marriageArray = [NSArray arrayWithObjects:@"单身",@"已婚", nil];
    self.yearsArray = [NSMutableArray array];
    for (int i = 1; i < 31; i++) {
        NSString *str = [NSString stringWithFormat:@"%d年(%d)期",i,12*i];
        [self.yearsArray addObject:str];
    }
     self.percentageTwoArray = [NSArray arrayWithObjects:@"3成",@"4成",@"8成", nil];
    //绘制视图
    for (int j = 0; j < 8; j ++) {
        UITextFiledAndUILabelTwo *tfAndUILabelTwo = [[UITextFiledAndUILabelTwo alloc]initWithFrame:CGRectMake(0, 60+j*50, 300, 50) andOptionTitle:[listArray objectAtIndex:j]];
        tfAndUILabelTwo.backgroundColor = [UIColor whiteColor];
        tfAndUILabelTwo.borderStyle = UITextBorderStyleRoundedRect;
        [self.backGroundView addSubview:tfAndUILabelTwo];
        if (j == 0) {
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-35, tfAndUILabelTwo.bounds.size.height-15)];
            tf.enabled = NO;
            self.MarriageTF = tf;
            tf.text = [self.marriageArray objectAtIndex:0];
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 1){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-10, tfAndUILabelTwo.bounds.size.height-15)];
            tf.keyboardType = UIKeyboardTypeNumberPad;
            self.personalTF= tf;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            tf.clearsOnBeginEditing = YES;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 2){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-10, tfAndUILabelTwo.bounds.size.height-15)];
            tf.keyboardType = UIKeyboardTypeNumberPad;
            self.spouseTF= tf;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            tf.clearsOnBeginEditing = YES;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 3){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-10, tfAndUILabelTwo.bounds.size.height-15)];
            tf.keyboardType = UIKeyboardTypeNumberPad;
            self.assessValueTwoTF= tf;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            tf.clearsOnBeginEditing = YES;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 4){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-10, tfAndUILabelTwo.bounds.size.height-15)];
            tf.keyboardType = UIKeyboardTypeNumberPad;
            self.houseAreaTwoTF= tf;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            tf.clearsOnBeginEditing = YES;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 5){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-35, tfAndUILabelTwo.bounds.size.height-15)];
            tf.enabled = NO;
            self.percentageTwoTF = tf;
            tf.text = [self.percentageTwoArray objectAtIndex:0];
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 6){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-35
                                                                           , tfAndUILabelTwo.bounds.size.height-15)];
            tf.enabled = NO;
            self.yeorTwoTF = tf;
            tf.text = [self.yearsArray objectAtIndex:0];
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 7){
            
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-10, tfAndUILabelTwo.bounds.size.height-15)];
            self.APRTwoTF = tf;
            tf.text = @"基准利率";
            tf.borderStyle = UITextBorderStyleRoundedRect;               //属性设置
            tf.enabled = NO;
            tf.adjustsFontSizeToFitWidth = YES;
            tf.textAlignment = NSTextAlignmentCenter;
            [self.backGroundView addSubview:tf];
            [tf release];
        }
        if (j == 0  ) {
            //创建UIButton
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(tfAndUILabelTwo.bounds.size.width/2+tfAndUILabelTwo.bounds.size.width/3+10, 56+tfAndUILabelTwo.bounds.size.height/6, 44,44);
            [btn setImage:[UIImage imageNamed:@"backLast"] forState:UIControlStateNormal];
            btn.tag =j;
            [btn addTarget:self action:@selector(seleckClick:) forControlEvents:UIControlEventTouchUpInside];
            //添加视图
            tfAndUILabelTwo.borderStyle = UITextBorderStyleRoundedRect;
            [self.backGroundView addSubview:btn];
            [tfAndUILabelTwo release];
            
        }else if (j==5 || j==6){
            //创建UIButton
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(tfAndUILabelTwo.bounds.size.width/2+tfAndUILabelTwo.bounds.size.width/3+10, 56+j*50+tfAndUILabelTwo.bounds.size.height/5, 44,44);
            [btn setImage:[UIImage imageNamed:@"backLast"] forState:UIControlStateNormal];
            btn.tag =j;
            [btn addTarget:self action:@selector(seleckClick:) forControlEvents:UIControlEventTouchUpInside];
            //添加视图
            tfAndUILabelTwo.borderStyle = UITextBorderStyleRoundedRect;
            [self.backGroundView addSubview:btn];
            [tfAndUILabelTwo release];
            
        }
    }
    //计算
    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTwo.frame = CGRectMake(0, 465, 300, 45);
    btnTwo.backgroundColor = [UIColor colorWithRed:232/255.0 green:233/255.0 blue:232/255.0 alpha:1 ];
    btnTwo.layer.cornerRadius = 5.0;
    [btnTwo setTitle:@"计算" forState:UIControlStateNormal];
    [btnTwo setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnTwo setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [btnTwo addTarget:self action:@selector(taxResult:) forControlEvents:UIControlEventTouchUpInside];
    [self.backGroundView addSubview:btnTwo];

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
    self.pickerViewSix = [[[UIPickerView alloc]initWithFrame:CGRectMake(10, 50, 300, 220)]autorelease];
    self.pickerViewSix.layer.cornerRadius = 10;
    self.pickerViewSix.backgroundColor = [UIColor whiteColor];
    //设置代理
    self.pickerViewSix.delegate = self;
    //显示选中框
    self.pickerViewSix.showsSelectionIndicator = YES;
    //弹出视图
    self.rootView = [[[UIView alloc]initWithFrame:CGRectMake(0, 180, 320, 275)]autorelease];
    self.rootView.backgroundColor = [UIColor colorWithRed:232/255.0 green:233/255.0 blue:232/255.0 alpha:1];
    //UIButton
    UIButton *btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCancel.frame = CGRectMake(275, 3, 44, 44);
    btnCancel.layer.cornerRadius = 5.0;
    btnCancel.titleLabel.font = [UIFont systemFontOfSize:13];
    [btnCancel setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnCancel setTitle:@"完成" forState: UIControlStateNormal];
    btnCancel.backgroundColor = [UIColor whiteColor];
    [btnCancel addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.rootView addSubview:btnCancel];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//键盘回收
- (void)keyboardReturn
{
    [self.MarriageTF resignFirstResponder];
    [self.personalTF resignFirstResponder];
    [self.spouseTF resignFirstResponder];
    [self.assessValueTwoTF resignFirstResponder];
    [self.houseAreaTwoTF resignFirstResponder];
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
        self.optionArray = [[[NSMutableArray alloc]initWithArray:array]autorelease];
    }
    [self.rootView addSubview:pickerView];
    [self.view  addSubview:self.rootView];
}
//计算
- (void)taxResult:(UIButton *)btn
{
    //获取月供款额
    //公积金
    NSArray * HPFLArray = [NSArray arrayWithObjects:@"851.50",@"434.25",@"295.24",@"225.79",@"184.17",@"158.74",@"139.00",@"124.23",@"112.78",@"103.64",@"96.19",@"90.00",@"84.79",@"80.34",@"76.50",@"73.16",@"70.22",@"67.63",@"65.33",@"63.26",@"61.41",@"59.74",@"58.22",@"56.84",@"55.58",@"54.43",@"53.37",@"52.40",@"51.50",@"50.67", nil];
   
    NSDate *currentDate = [NSDate dateWithTimeIntervalSinceNow:8*3600];
    //获取数据，存入数据库，得出结果
        if ([self.MarriageTF.text isEqualToString:@""] || [self.personalTF.text isEqualToString:@""]||[self.assessValueTwoTF.text isEqualToString:@""]||[self.houseAreaTwoTF.text isEqualToString:@""]) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"小提示" message:@"数据不能为空哦" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            [alertView release];
            return;
        }
        HPFLoadModel *HPFLModel = [[[HPFLoadModel alloc]init]autorelease];
        //属性设置
        //婚姻状况
        HPFLModel.marriage = self.MarriageTF.text;
        //个人月缴存
        HPFLModel.personal = self.personalTF.text;
        //配偶月缴存
        HPFLModel.spouse = self.spouseTF.text;
        //评估值
        HPFLModel.assessValue = self.assessValueTwoTF.text;
        //面积
        HPFLModel.houseArea = self.houseAreaTwoTF.text;
        //按揭成数
        HPFLModel.percentage = self.percentageTwoTF.text;
        //按揭年数
        HPFLModel.year = self.yeorTwoTF.text;
        //利率分类
        HPFLModel.APR = self.APRTwoTF.text;
        //年利率值
        //获取年利率//获取月供款额
        NSString *str = [self.yeorTwoTF.text substringWithRange:NSMakeRange(0, 1)];
        NSString *str1 =[self.yeorTwoTF.text substringWithRange:NSMakeRange(1,1)];
        int num;
        if ([str1 isEqualToString:@"年"]) {
            num = [str intValue];
        }else{
            NSString *strYear = [self.yeorTwoTF.text substringWithRange:NSMakeRange(0, 2)];
            num = [strYear intValue];
        }
        
        if (num <= 5) {
            HPFLModel.APRValue = @"4.00";
        }else if (num >5){
            HPFLModel.APRValue = @"4.50";
        }
        //月供款额
        HPFLModel.monthMoney = [HPFLArray objectAtIndex:num-1];
        //时间
        HPFLModel .date = [NSString stringWithFormat:@"%@",currentDate];
        HPFLModel.date = [HPFLModel.date substringToIndex:19];
        //处理数据
        HPFLModel = [HPFLHandler returnHPFLModel:HPFLModel];
        //数据库添加记录
        [DBManger insertHPFLInforWithModel:HPFLModel];
        //跳转页面
        //页面跳转
        HPFLResultViewController *HPFLResultVC = [[HPFLResultViewController alloc]init];
    /*
     //婚姻状况//个人月缴存//配偶月缴存//房屋评估值//房屋面积//按揭成数//按揭年数//贷款年利率
     
     //年利率//月供款额//可贷款数(评估值计算)//可贷款数（月缴存计算）//可贷款数(最终值)//月还款(评估值计算)//月还款（月缴存计算）//月还款最终值
     */
    //信息
    HPFLResultVC.inforArray = [NSArray arrayWithObjects:HPFLModel.marriage,HPFLModel.personal,HPFLModel.spouse,HPFLModel.assessValue,HPFLModel.houseArea,HPFLModel.percentage,HPFLModel.year,HPFLModel.APR,nil];
    //结果
    HPFLResultVC.HPFLArray = [NSArray arrayWithObjects:HPFLModel.APRValue,HPFLModel.monthMoney,HPFLModel.loadMoneyOne,HPFLModel.monthLoadMoneyOne,HPFLModel.loadMoneyTwo,HPFLModel.monthLoadMoneyTwo,HPFLModel.loadMoneyLast,HPFLModel.monthLoadMoneyLast,nil];
        [self.navigationController pushViewController:HPFLResultVC animated:YES];
        [HPFLResultVC release];
}
//弹出视图
- (void)seleckClick:(UIButton *)btn
{
    if (btn.tag == 0) {
        self.flag = 5;
        [self addViewWithNSArray:self.marriageArray andPickerView:self.pickerViewSix];
    }else if (btn.tag == 5){
        self.flag = 3;
        [self addViewWithNSArray:self.percentageTwoArray andPickerView:self.pickerViewFour];
        
    }else if (btn.tag == 6){
        self.flag = 4;
        [self addViewWithNSArray:self.yearsArray andPickerView:self.pickerViewFive];
        
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
    if(self.flag == 3){
        return self.percentageTwoArray.count;
    }else if(self.flag == 5){
        return self.marriageArray.count;
    }  else{
        return self.yearsArray.count;
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
    if ([[self.optionArray objectAtIndex:0] isEqualToString:@"3成"]) {
            self.percentageTwoTF.text = [self.optionArray objectAtIndex:row];
    }else if([[self.optionArray objectAtIndex:0] isEqualToString:@"1年(12)期"]){
            self.yeorTwoTF.text = [self.optionArray objectAtIndex:row];
       
    }else if ([[self.optionArray objectAtIndex:0] isEqualToString:@"单身"]){
        self.MarriageTF.text = [self.optionArray objectAtIndex:row];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
