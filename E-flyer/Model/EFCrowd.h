//
//  EFCrowd.h
//  E-flyer
//  人群
//  Created by Jason_Msbaby on 16/4/10.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "BasicModel.h"

@interface EFCrowd : BasicModel

@property(strong,nonatomic) NSString *job;//职业
@property(assign,nonatomic) NSInteger sort;//排序

@property(strong,nonatomic) NSArray<EFCrowd *> *data;//所有人群基本数据

- (instancetype)initWithJob:(NSString *)job sort:(NSInteger)sort;

- (void)initFromRemote;

+ (instancetype)shareInstance;

@end
