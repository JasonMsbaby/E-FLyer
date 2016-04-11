//
//  HouseLoadTwoViewController.h
//  House_Project
//
//  Created by lanou3g on 14-11-12.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HouseLoadTwoViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
//背景view
@property (nonatomic, retain)  UIScrollView *backGroundView;
@property (nonatomic, retain)UIView *rootView;
//选择控件
@property (nonatomic, retain) UIPickerView *pickerViewFour;
@property (nonatomic, retain) UIPickerView *pickerViewFive;
@property (nonatomic, retain) UIPickerView *pickerViewSix;
//数组
@property (nonatomic , retain)NSArray *percentageTwoArray;
@property (nonatomic, retain)NSArray *marriageArray;
@property (nonatomic , retain)NSMutableArray *optionArray;
@property (nonatomic , retain)NSMutableArray *yearsArray;

//标识
@property (nonatomic,assign) int flag;
//视图2
//婚姻状况
@property (nonatomic , retain)UITextField *MarriageTF;
//个人月缴存
@property (nonatomic, retain)UITextField *personalTF;
//配偶月缴存
@property (nonatomic, retain)UITextField *spouseTF;
//房屋评估值
@property (nonatomic , retain)UITextField *assessValueTwoTF;
//房屋面积
@property (nonatomic , retain)UITextField *houseAreaTwoTF;
//按揭成数
@property (nonatomic , retain)UITextField *percentageTwoTF;
//按揭年数
@property (nonatomic , retain)UITextField *yeorTwoTF;
//贷款年利率
@property (nonatomic , retain)UITextField *APRTwoTF;

@end
