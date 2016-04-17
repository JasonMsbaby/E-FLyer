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

static EFCrowd *crowd;

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        crowd = [[EFCrowd alloc]init];
    });
    return crowd;
}



- (void)initFromRemote{
    AVQuery *query = [EFCrowd query];
    [query openCache];
    self.data = [query findObjects];
    
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
