//
//  EFLog.m
//  E-flyer
//  金额日志表
//  Created by 苗爽 on 16/4/24.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "EFLog.h"

@implementation EFLog
@dynamic user;
@dynamic money;
@dynamic type;
@dynamic good;

+(void)load{
    [super load];
    [self registerSubclass];
}


+ (void)LogWithBlock:(void (^)(NSArray<EFLog *>*))block{
    AVQuery *query = [EFLog query];
    [query includeKey:@"user"];
    [query includeKey:@"good"];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithSuccess:^(NSArray *result) {
        if (block != nil) {
            block(result);
        }
    }];
}

@end
