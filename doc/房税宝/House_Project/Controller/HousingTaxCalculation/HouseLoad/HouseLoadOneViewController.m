//
//  HouseLoadOneViewController.m
//  House_Project
//
//  Created by lanou3g on 14-11-12.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HouseLoadOneViewController.h"
#import "UITextFiledAndUILabelTwo.h"
#import "BusinessLoanModel.h"
#import "HouseLoadResultViewController.h"
#import "BLoadHandler.h"
#import "DBManger.h"
@interface HouseLoadOneViewController ()

@end

@implementation HouseLoadOneViewController
- (void)dealloc
{
    [_backGroundView release];
    [_rootView release];
    [_assessValueTF release];
    [_houseAreaTF release];
    [_percentageArray release];
    [_yearTF release];
    [_APRTF release];
    [_optionArray release];
    [_percentageArray release];
    [_yearsArray release];
    [_APRArray release];
    [_pickerViewOne release];
    [_pickerViewTwo release];
    [_pickerViewThree release];
    [super dealloc];
}
//清空数据
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.assessValueTF.text = @"";
    self.houseAreaTF.text = @"";
    self.percentageTF.text = [self.percentageArray objectAtIndex:0];
    self.yearTF.text = [self.yearsArray objectAtIndex:0];
    self.APRTF.text = [self.APRArray objectAtIndex:0];
    
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
    NSArray *listArray = [NSArray arrayWithObjects:@"房屋评估值(元)",@"房屋面积（平米）",@"按揭成数",@"按揭年数",@"年贷款利率分类",nil];
     self.percentageArray = [NSArray arrayWithObjects:@"3成",@"4成",@"7成", nil];
    self.yearsArray = [NSMutableArray array];
    for (int i = 1; i < 31; i++) {
        NSString *str = [NSString stringWithFormat:@"%d年(%d)期",i,12*i];
        [self.yearsArray addObject:str];
    }
    self.APRArray = [NSArray arrayWithObjects:@"基准利率",@"上浮20%",@"上浮15%",@"上浮10%",@"下浮10%",@"下浮15%",nil];

    //创建
    for (int j = 0; j < 5; j ++) {
        UITextFiledAndUILabelTwo *tfAndUILabelTwo = [[UITextFiledAndUILabelTwo alloc]initWithFrame:CGRectMake(0, 60+j*50, 300, 50) andOptionTitle:[listArray objectAtIndex:j]];
        tfAndUILabelTwo.backgroundColor = [UIColor whiteColor];
        tfAndUILabelTwo.borderStyle = UITextBorderStyleRoundedRect;
        [self.backGroundView addSubview:tfAndUILabelTwo];
        if (j == 0) {
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-10, tfAndUILabelTwo.bounds.size.height-15)];
            self.assessValueTF = tf;
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
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-10, tfAndUILabelTwo.bounds.size.height-15)];
            tf.keyboardType = UIKeyboardTypeNumberPad;
            self.houseAreaTF= tf;
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            tf.clearsOnBeginEditing = YES;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 2){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-35, tfAndUILabelTwo.bounds.size.height-15)];
            tf.enabled = NO;
            self.percentageTF = tf;
            tf.text = [self.percentageArray objectAtIndex:0];
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 3){
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-35, tfAndUILabelTwo.bounds.size.height-15)];
            tf.enabled = NO;
            self.yearTF = tf;
            tf.text = [self.yearsArray objectAtIndex:0];
            //属性设置
            tf.adjustsFontSizeToFitWidth = YES;
            tf.borderStyle = UITextBorderStyleRoundedRect;
            tf.textAlignment = NSTextAlignmentCenter;
            [self.backGroundView addSubview:tf];
            [tf release];
        }else if (j == 4){
            
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(tfAndUILabelTwo.bounds.size.width/2, 60+j*50+tfAndUILabelTwo.bounds.size.height/6, tfAndUILabelTwo.bounds.size.width/2-35, tfAndUILabelTwo.bounds.size.height-15)];
            self.APRTF = tf;
            tf.text = [self.APRArray objectAtIndex:0];
            tf.borderStyle = UITextBorderStyleRoundedRect;               //属性设置
            tf.enabled = NO;
            tf.adjustsFontSizeToFitWidth = YES;
            tf.textAlignment = NSTextAlignmentCenter;
            [self.backGroundView addSubview:tf];
            [tf release];
        }
        if (j==2 || j==3 ||j==4 ) {
            //创建UIButton
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(tfAndUILabelTwo.bounds.size.width/2+tfAndUILabelTwo.bounds.size.width/3+10, 56+j*50 +tfAndUILabelTwo.bounds.size.height/5, 44,44);
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
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 315, 300, 45);
    btn.backgroundColor = [UIColor colorWithRed:232/255.0 green:233/255.0 blue:232/255.0 alpha:1 ];
    btn.layer.cornerRadius = 5.0;
    [btn setTitle:@"计算" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(taxResult:) forControlEvents:UIControlEventTouchUpInside];
    [self.backGroundView addSubview:btn];
    
    //设置选择器1
    self.pickerViewOne = [[[UIPickerView alloc]initWithFrame:CGRectMake(10, 50, 300, 220)]autorelease];
    self.pickerViewOne.layer.cornerRadius = 10;
    self.pickerViewOne.backgroundColor = [UIColor whiteColor];
    //设置代理
    self.pickerViewOne.delegate = self;
    //显示选中框
    self.pickerViewOne.showsSelectionIndicator = YES;
    
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
//键盘回收
- (void)keyboardReturn
{
    [self.assessValueTF resignFirstResponder];
    [self.houseAreaTF resignFirstResponder];
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
    //商贷
    NSArray * UP15Array = [NSArray arrayWithObjects:@"864.81",@"448.05",@"309.10",@"241.14",@"199.71",@"137.06",@"153.54",@"139.00",@"127.78",@"118.87",@"111.65",@"105.70",@"100.72",@"96.50",@"92.89",@"89.77",@"87.06",@"84.69",@"82.60",@"80.76",@"79.12",@"77.66",@"76.35",@"75.17",@"74.11",@"73.15",@"72.29",@"71.51",@"70.79",@"70.14", nil];
    NSArray * UP20Array =[NSArray arrayWithObjects:@"866.09",@"449.45",@"310.51",@"242.63",@"201.24",@"174.65",@"155.17",@"140.66",@"129.46",@"120.59",@"113.40",@"107.48",@"102.53",@"98.34",@"94.76",@"91.67",@"88.99",@"86.65",@"84.59",@"82.77",@"81.16",@"79.73",@"78.44",@"77.29",@"76.26",@"75.32",@"74.48",@"73.72",@"73.03",@"72.40", nil];
    
    NSArray *down15Array = [NSArray arrayWithObjects:@"856.53",@"439.73",@"300.73",@"232.29",@"190.73",@"163.69",@"144.02",@"129.32",@"117.93",@"108.86",@"101.48",@"95.36",@"90.22",@"85.84",@"82.07",@"78.79",@"75.93",@"73.4",@"71.17",@"69.17",@"67.38",@"65.78",@"64.32",@"63.01",@"61.81",@"60.72",@"59.73",@"58.81",@"57.97",@"57.2", nil];
    NSArray *down10Array = [NSArray arrayWithObjects:@"857.91",@"441.11",@"302.12",@"233.75",@"192.21",@"165.23",@"145.58",@"130.90",@"119.54",@"110.49",@"103.14",@"97.04",@"91.92",@"87.57",@"83.82",@"80.57",@"77.73",@"75.23",@"73.01",@"71.04",@"69.27",@"67.69",@"66.26",@"64.96",@"63.79",@"62.72",@"61.74",@"60.85",@"60.03",@"59.28", nil];
    NSArray *BLArray = [NSArray arrayWithObjects:@"860.66",@"443.88",@"304.90",@"236.69",@"195.19",@"168.34",@"148.74",@"134.11",@"122.80",@"113.80",@"106.50",@"100.45",@"95.39",@"91.08",@"87.39",@"84.19",@"81.40",@"78.94",@"76.78",@"74.85", @"73.13",@"71.60",@"70.21",@"68.96",@"67.83",@"66.81",@"65.88",@"65.02",@"64.25",@"63.54", nil];
    NSArray *up10Array = [NSArray arrayWithObjects:@"863.42",@"446.66",@"307.70",@"239.65",@"198.20",@"171.48",@"151.93",@"137.36",@"126.10",@"117.17", @"109.92",@"103.93",@"98.92",@"94.67",@"91.03",@"87.89",@"85.15",@"82.75",@"80.64",@"78.77",@"77.10",@"75.61",@"74.27",@"73.07",@"71.99",@"71.01",@"70.12",@"69.32",@"68.58",@"67.91",nil];
    
    
    NSDate *currentDate = [NSDate dateWithTimeIntervalSinceNow:8*3600];
    //获取数据，存入数据库，得出结果
        //判断数据是否为空
        if ([self.assessValueTF.text isEqualToString:@""] || [self.houseAreaTF.text isEqualToString:@""]) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"小提示" message:@"数据不能为空哦" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            [alertView release];
            return;
        }
        BusinessLoanModel *blModel = [[BusinessLoanModel alloc]init];
        //房屋评估值
        blModel.assessValue = self.assessValueTF.text;
        //房屋面积
        blModel.houseArea = self.houseAreaTF.text;
        //按揭成数
        blModel.percentage = self.percentageTF.text;
        //按揭年数
        blModel.year = self.yearTF.text;
        //利率分类
        blModel.APR = self.APRTF.text;
        //获取年利率//获取月供款额
        NSString *str = [self.yearTF.text substringWithRange:NSMakeRange(0, 1)];
        NSString *str1 =[self.yearTF.text substringWithRange:NSMakeRange(1,1)];
        int num;
        if ([str1 isEqualToString:@"年"]) {
            num = [str intValue];
        }else{
            NSString *strYear = [self.yearTF.text substringWithRange:NSMakeRange(0, 2)];
            num = [strYear intValue];
        }
        
        for (int i = 1; i < 31; i++) {
            if (num == 1) {
                blModel.APRValue = @"6.00";
            }else if (num>1 && num < 4){
                blModel.APRValue = @"6.15";
            }else if (num >3 && num < 6){
                blModel.APRValue = @"6.40";
            }else if (num >5){
                blModel.APRValue = @"6.55";
            }
        }
        float value = [blModel.APRValue floatValue];
        if ([self.APRTF.text isEqualToString:@"上浮20%"]){
            blModel.APRValue = [NSString stringWithFormat:@"%.2f",value * (1 +0.2)];
            blModel.monthMoney = [UP20Array objectAtIndex:num-1];
        }else if ([self.APRTF.text isEqualToString:@"上浮15%"]){
            blModel.APRValue = [NSString stringWithFormat:@"%.2f",value * (1 +0.15)];
            blModel.monthMoney = [UP15Array objectAtIndex:num-1];
        }else if ([self.APRTF.text isEqualToString:@"上浮10%"]){
            blModel.APRValue = [NSString stringWithFormat:@"%.2f",value * (1 +0.1)];
            blModel.monthMoney = [up10Array objectAtIndex:num-1];
        }else if ([self.APRTF.text isEqualToString:@"下浮10%"]){
            blModel.APRValue = [NSString stringWithFormat:@"%.2f",value * (1 - 0.1)];
            blModel.monthMoney = [down10Array objectAtIndex:num-1];
        }else if ([self.APRTF.text isEqualToString:@"下浮15%"]){
            blModel.APRValue = [NSString stringWithFormat:@"%.2f",value * (1 - 0.15)];
            blModel.monthMoney = [down15Array objectAtIndex:num-1];
        }else if ([self.APRTF.text isEqualToString:@"基准利率"]){
            blModel.monthMoney = [BLArray objectAtIndex:num-1];
        }
        
        blModel.date = [NSString stringWithFormat:@"%@",currentDate];
        blModel.date = [blModel.date substringToIndex:19];
        //计算
        blModel = [BLoadHandler returnBLModelWithModel:blModel];
        //数据库添加记录
        [DBManger insertBLInforWithModel:blModel];
    /*
     //房屋评估值//房屋面积//按揭成数//按揭年数//贷款年利率//年利率//月供款额//可贷款数//月还款

     */
        //页面跳转
        HouseLoadResultViewController *loadResultVC = [[HouseLoadResultViewController alloc]init];
        loadResultVC.inforArray = [NSArray arrayWithObjects:blModel.assessValue,blModel.houseArea,blModel.percentage,blModel.year,blModel.APR, nil];

        loadResultVC.loadListArray = [NSArray arrayWithObjects:blModel.APRValue,blModel.monthMoney,blModel.loadMoney,blModel.monthLoadMoney,nil];
        [self.navigationController pushViewController:loadResultVC animated:YES];
        [loadResultVC release];
   
    
}
//弹出视图
- (void)seleckClick:(UIButton *)btn
{
    if (btn.tag == 2) {
        self.flag = 0;
        [self addViewWithNSArray:self.percentageArray andPickerView:self.pickerViewOne];
    }else if(btn.tag == 3){
        self.flag = 1;
        [self addViewWithNSArray:self.yearsArray andPickerView:self.pickerViewTwo];
    }else if(btn.tag == 4){
        self.flag = 2;
        [self addViewWithNSArray:self.APRArray andPickerView:self.pickerViewThree];
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
        return self.percentageArray.count;
    }else if(self.flag == 2){
        return self.APRArray.count;
    } else {
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
        self.percentageTF.text = [self.optionArray objectAtIndex:row];
    }else if([[self.optionArray objectAtIndex:0] isEqualToString:@"1年(12)期"]){

            self.yearTF.text = [self.optionArray objectAtIndex:row];
        
    }else if([[self.optionArray objectAtIndex:0] isEqualToString:@"基准利率"]){
        self.APRTF.text = [self.optionArray objectAtIndex:row];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
