//
//  HouseTaxCalculationViewHomeController.h
//  House_Project
//
//  Created by lanou3g on 14-10-14.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HouseInforModel.h"
@interface HouseTaxCalculationViewHomeController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
//背景view
@property (nonatomic, retain)  UIScrollView *backGroundView;
//类型列表数组
@property (nonatomic, retain)  NSArray *typeArray;
//单位数组
@property (nonatomic ,retain)  NSArray *unitArray;
//类型数组
@property (nonatomic, retain)  NSArray *typeTwoArray;
//数据源数组
@property (nonatomic, retain)   NSArray *houseTypeArray ;
//年限数组
@property (nonatomic, retain)  NSArray *yearsArray;
//住房套数数组
@property (nonatomic, retain)   NSArray *numSellerArray;
//住房套数
@property (nonatomic, retain)   NSArray *numBuyerArray;
//贷款类型
@property (nonatomic, retain)   NSArray *dkTypeArray;
//中介服务费百分比
@property (nonatomic, retain)   NSArray *presenArray;

//数组
@property (nonatomic, retain)  NSMutableArray *optionArray;
//房屋信息model
@property (nonatomic, retain) HouseInforModel *inforModel;

//输入框tf,成交价
@property (nonatomic, retain)  UITextField *tf;
//底价（网签价）
@property (nonatomic, retain)   UITextField *basePrice;
//输入框，所售住房面积
@property (nonatomic, retain)  UITextField *houseAreaTF;
//输入框,房屋原值
@property (nonatomic, retain)   UITextField *costTF;

//标识
@property (nonatomic,assign) int flag;
//选择控件1
@property (nonatomic ,retain)   UIPickerView *pickerView;
//选择控件2
@property (nonatomic, retain) UIPickerView *pickerViewTwo;
//选择控件3
@property (nonatomic, retain) UIPickerView *pickerViewThree;
//选择控件4
@property (nonatomic, retain) UIPickerView *pickerViewFour;
//选择控件5
@property (nonatomic, retain) UIPickerView *pickerViewFive;
//选择控件6
@property (nonatomic, retain) UIPickerView *pickerViewSix;

//选择框
//所售住房性质
@property (nonatomic, retain)  UITextField *optionTF;
//所售住房购买年限
@property (nonatomic, retain)  UITextField *optionTFTwo;
//现有住房
@property (nonatomic, retain)  UITextField *sellerHouseNumTF;
//现有住房
@property (nonatomic, retain)  UITextField *buyerHouseNumTF;
//贷款类型
@property (nonatomic, retain)  UITextField *dkType;
//贷款金额
@property (nonatomic, retain)   UITextField *dkMoney;
//中介服务费百分比
@property (nonatomic, retain)  UITextField *presen;


//根视图
@property (nonatomic, retain)UIView *rootView ;

@end
