//
//  EFCrowd.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/10.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "EFCrowd.h"

@implementation EFCrowd
@dynamic job;
@dynamic sort;

+ (void)load{
    [super load];
    [self registerSubclass];
}

- (instancetype)initWithJob:(NSString *)job sort:(NSInteger)sort{
    self = [super init];
    if (self) {
        self.job = job;
        self.sort = sort;
    }
    return self;
}
@end
