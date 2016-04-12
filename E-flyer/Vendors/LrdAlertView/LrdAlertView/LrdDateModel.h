//
//  LrdDateModel.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/12.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LrdDateModel : NSObject
@property(strong,nonatomic) NSString *title;

- (instancetype)initWithTitle:(NSString *)title;
@end
