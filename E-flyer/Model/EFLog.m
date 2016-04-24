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
@dynamic source;

+(void)load{
    [super load];
    [self registerSubclass];
}
+ (void)saveLogWithType:(EFLogType)type Source:(NSString *)source  Money:(CGFloat)money Good:(EFGood *)good{
    EFLog *log = [EFLog object];
    log.user = [EFUser currentUser];
    log.type = type;
    log.money = money;
    log.source = source;
    if (good != nil) {
        log.good = good;
    }
    [log saveInBackground];
}
+ (void)saveLogWithType:(EFLogType)type Source:(NSString *)source Money:(CGFloat)money Good:(EFGood *)good Finish:(void (^)(BOOL success))finish{
    EFLog *log = [EFLog object];
    log.user = [EFUser currentUser];
    log.type = type;
    log.money = money;
    log.source = source;
    if (good != nil) {
        log.good = good;
    }
    [log saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!succeeded) {
            [SVProgressHUD showErrorWithStatus:@"操作记录保存失败"];
            finish(NO);
        }else{
            finish(YES);
        }
    }];
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
