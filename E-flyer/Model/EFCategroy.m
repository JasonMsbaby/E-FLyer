//
//  EFCategroy.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "EFCategroy.h"

@implementation EFCategroy

@dynamic name;
@dynamic index;
@dynamic desc;
@dynamic image;



static EFCategroy *categroy;


+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        categroy = [[EFCategroy alloc]init];
    });
    return categroy;
}

- (void)initWithRemote{
    AVQuery *query = [EFCategroy query];
    [query includeKey:@"image"];
    [query openCache];
    self.data = [query findObjects];
}


+ (void)load{
    [super load];
    [self registerSubclass];
}



@end
