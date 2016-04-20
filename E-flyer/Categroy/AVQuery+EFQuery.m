//
//  AVQuery+EFQuery.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "App.h"
#import "AVQuery+EFQuery.h"
#import "SVProgressHUD.h"

@implementation AVQuery (EFQuery)

- (void)findObjectsInBackgroundWithSuccess:(success)success{
    [SVProgressHUD showWithStatus:@"正在拼命加载数据,请稍等"];
    [self findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error == nil) {
            NSLog(@"%@",objects);
            success(objects);
            [SVProgressHUD dismiss];
        }else{
            NSLog(@"===============================================================%@",error);
            NSString *c = [NSString stringWithFormat:@"code_%ld",error.code];
            App *app = [App sharedApp];
            NSString *e = app.kCode[c];
            [SVProgressHUD showErrorWithStatus:e];
        }
    }];
}

- (void)findObjectsInForegroundWithSuccess:(success)success{
    [SVProgressHUD showWithStatus:@"正在拼命加载数据,请稍等"];
    [self findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error == nil) {
            NSLog(@"%@",objects);
            success(objects);
            [SVProgressHUD dismiss];
        }else{
            NSLog(@"===============================================================%@",error);
            NSString *c = [NSString stringWithFormat:@"code_%ld",error.code];
            App *app = [App sharedApp];
            NSString *e = app.kCode[c];
            [SVProgressHUD showErrorWithStatus:e];
        }
        [SVProgressHUD dismiss];
    }];
}

-(void)openCache{
    self.cachePolicy = kAVCachePolicyNetworkElseCache;
    self.maxCacheAge = 24*3600;
}
@end
