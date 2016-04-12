//
//  EFCategroy.h
//  E-flyer
//  商品分类表
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "BasicModel.h"

@interface EFCategroy : BasicModel

@property(strong,nonatomic) NSString *name;
@property(strong,nonatomic) NSString *desc;
@property(assign,nonatomic) int index;
@property(strong,nonatomic) AVFile *image;

@property(strong,nonatomic) NSArray<EFCategroy *> *data;

- (void)initWithRemote;
+ (instancetype)shareInstance;

@end
