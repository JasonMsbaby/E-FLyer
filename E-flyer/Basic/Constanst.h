//
//  Constanst.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/28.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <Foundation/Foundation.h>
#ifndef Constanst_h
#define Constanst_h

#define WeakObj(o) __weak typeof(o) o##Weak = o;


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kRandomColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1]




//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define NSLog(format, ...) do {                                                             \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "-------\n");                                               \
} while (0)
#else
#define NSLog(...)
#endif
//---------------------系统常量--------------------------
#define kRegist_Time 60







#endif /* Constanst_h */


