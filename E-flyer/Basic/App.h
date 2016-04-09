//
//  App.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/9.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App : NSObject
@property(strong,nonatomic) NSDictionary *kCode;

+ (instancetype)sharedApp;
@end
