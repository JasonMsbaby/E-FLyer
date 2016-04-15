//
//  BasicModel.h
//  E-flyer
//  LeanClould对象的基类
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "AVQuery+EFQuery.h"
#import <Foundation/Foundation.h>
#import <AVOSCloud.h>
#import "Constanst.h"
typedef void(^callback)(NSArray *result,NSError *error);
@interface BasicModel : AVObject <AVSubclassing>

@end
