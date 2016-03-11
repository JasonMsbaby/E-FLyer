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

+ (void)load{
    [super load];
    [self registerSubclass];
}

+ (void)listEFCategroyonSuccess:(success)success{
    AVQuery *query = [EFCategroy query];
    [query includeKey:@"image"];
    [query findObjectsInBackgroundWithSuccess:^(NSArray<EFCategroy *> *result) {
        success(result);
    }];
}


@end
