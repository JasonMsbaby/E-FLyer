//
//  EFCity.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/10.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "EFCity.h"

@implementation EFCity
@dynamic province;
@dynamic cityName;
@dynamic sort;

+ (void)load{
    [super load];
    [self registerSubclass];
}
-(instancetype)initWithProName:(NSString *)pro cityName:(NSString*)cityName sort:(NSInteger)sort{
    if (self = [super init]) {
        self.province = pro;
        self.cityName = cityName;
        self.sort = sort;
    }
    return self;
}
@end
