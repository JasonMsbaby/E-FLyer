//
//  EFCity.h
//  E-flyer
//  城市
//  Created by Jason_Msbaby on 16/4/10.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "BasicModel.h"

@interface EFCity : BasicModel
@property(strong,nonatomic) NSString *province;//所属省份
@property(strong,nonatomic) NSString *cityName;//城市名称
@property(assign,nonatomic) NSInteger sort;//排序


-(instancetype)initWithProName:(NSString *)pro cityName:(NSString*)cityName sort:(NSInteger)sort;
@end
