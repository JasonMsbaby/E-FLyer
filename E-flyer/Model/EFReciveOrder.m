//
//  EFReciveOrder.m
//  E-flyer
//
//  Created by 苗爽 on 16/4/22.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "EFReciveOrder.h"

@implementation EFReciveOrder

@dynamic user;
@dynamic good;


+ (void)load{
    [super load];
    [self registerSubclass];
}

+ (void)IsUserHaveReceiveWithGood:(EFGood *)good Finish:(void (^)(BOOL))is{
    EFUser *currentUser = [EFUser currentUser];
    if (currentUser != nil) {
        AVQuery *query = [EFReciveOrder query];
        [query whereKey:@"user" equalTo:currentUser];
        [query whereKey:@"good" equalTo:good];
        [query findObjectsInBackgroundWithSuccess:^(NSArray *result) {
            if (result != nil && result.count > 0) {
                is(YES);
            }else{
                is(NO);
            }
        }];
    }
}

+ (void)userReceiveOrderWithBlock:(EFReceiveBlock)block{
    AVQuery *query = [EFReciveOrder query];
    [query includeKey:@"user"];
    [query includeKey:@"good"];
    [query orderByDescending:@"createdAt"];
    [query whereKey:@"user" equalTo:[EFUser currentUser]];
    [query findObjectsInBackgroundWithSuccess:^(NSArray *result) {
        if (block != nil) {
            block(result);
        }
    }];
}

@end
