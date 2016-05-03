//
//  EFUser.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "ToolUtils.h"
#import "EFUser.h"

@implementation EFUser
@dynamic money;
@dynamic type;
@dynamic crowd;
@dynamic headImg;
@dynamic lat;
@dynamic lng;

@dynamic barAddress;
@dynamic barImg;
@dynamic barInfo;
@dynamic barName;
@dynamic barPhone;

+(void)load{
    [super load];
    [self registerSubclass];
}
+ (NSString *)parseClassName{
    return @"_User";
}

+ (void)barInfoListWithPage:(NSInteger)page Block:(UserBlock)block{
    AVQuery *query = [EFUser query];
    [query whereKey:@"type" equalTo:UserRoleTypeBar];
    [query orderByDescending:@"updatedAt"];
    [query findObjectsInBackgroundWithSuccess:^(NSArray *result) {
        if (block) {
            block(result);
        }
    }];
}






@end
