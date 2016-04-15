//
//  EFBMKModel.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/14.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "EFBMKModel.h"

@implementation EFBMKModel

@dynamic lat;
@dynamic lng;
@dynamic latSpan;
@dynamic lngSpan;
@dynamic scope;
@dynamic zoomLevel;
@dynamic address;

+ (void)load{
    [super load];
    [self registerSubclass];
}


+(instancetype)ChinaArea{
    static EFBMKModel *model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model.lat = 0;
        model.lng = 0;
        model.address = @"全国";
    });
    return model;
}

@end
