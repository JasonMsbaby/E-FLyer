//
//  HouseLoadOneViewController.h
//  House_Project
//
//  Created by lanou3g on 14-11-12.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HouseLoadOneViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
//视图一
//背景view
@property (nonatomic, retain)  UIScrollView *backGroundView;
@property (nonatomic, retain)UIView *rootView;
//房屋评估值
@property (nonatomic , retain)UITextField *assessValueTF;
//房屋面积
@property (nonatomic , retain)UITextField *houseAreaTF;
//按揭成数
@property (nonatomic , retain)UITextField *percentageTF;
//按揭年数
@property (nonatomic , retain)UITextField *yearTF;
//贷款年利率
@property (nonatomic , retain)UITextField *APRTF;
//数组
@property (nonatomic , retain)NSMutableArray *optionArray;
@property (nonatomic , retain)NSArray *percentageArray;
@property (nonatomic , retain)NSMutableArray *yearsArray;
@property (nonatomic , retain)NSArray *APRArray;
//标识
@property (nonatomic,assign) int flag;
//选择控制器
@property (nonatomic, retain)UIPickerView  *pickerViewOne;
@property (nonatomic, retain)UIPickerView  *pickerViewTwo;
@property (nonatomic, retain)UIPickerView  *pickerViewThree;
@end
