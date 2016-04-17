//
//  MeInfoModel.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/17.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeInfoModel : NSObject
@property(strong,nonatomic) NSString *idd;
@property(strong,nonatomic) NSString  *img;
@property(strong,nonatomic) NSString *title;
@property(strong,nonatomic) NSString *content;

@property(strong,nonatomic) NSMutableDictionary *source;

- (instancetype)initWithIdd:(NSString *)idd Image:(NSString *)img Title:(NSString *)title Content:(NSString *)content;


+(instancetype)sharedInstance;

@end
