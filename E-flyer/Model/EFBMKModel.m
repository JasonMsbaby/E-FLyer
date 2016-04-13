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
@dynamic scope;
@dynamic zoomLevel;
@dynamic address;

+ (void)load{
    [super load];
    [self registerSubclass];
}


@end
