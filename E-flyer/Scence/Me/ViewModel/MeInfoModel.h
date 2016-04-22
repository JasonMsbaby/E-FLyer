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
@property(nonatomic,assign) BOOL haveNext;

@property(strong,nonatomic) NSMutableDictionary *source;

+(instancetype)sharedInstance;

@end
