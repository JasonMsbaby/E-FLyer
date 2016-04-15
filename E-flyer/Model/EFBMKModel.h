//
//  EFBMKModel.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/14.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "BasicModel.h"

@interface EFBMKModel : BasicModel
@property(assign,nonatomic) CGFloat lat;//纬度
@property(assign,nonatomic) CGFloat lng;//经度
@property(assign,nonatomic) float latSpan;//纬度范围
@property(assign,nonatomic) float lngSpan;//经度范围
@property(assign,nonatomic) CGFloat scope;//方圆距离 单位米 直径
@property(assign,nonatomic) NSInteger zoomLevel;//缩放级别
@property(strong,nonatomic) NSString *address;//位置信息

+(instancetype)ChinaArea;
@end
