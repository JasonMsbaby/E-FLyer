//
//  AVQuery+EFQuery.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "AVQuery+EFQuery.h"
#import "SVProgressHUD.h"

@implementation AVQuery (EFQuery)

- (void)findObjectsInBackgroundWithSuccess:(success)success{
    [self findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error == nil) {
            NSLog(@"%@",objects);
            success(objects);
        }else{
            NSLog(@"===============================================================%@",error);
            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%ld",error.code]];
        }
    }];
}

- (void)findObjectsInForegroundWithSuccess:(success)success{
    [SVProgressHUD showWithStatus:@"正在拼命加载数据,请稍等"];
    [self findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error == nil) {
            NSLog(@"%@",objects);
            success(objects);
        }else{
            NSLog(@"===============================================================%@",error);
            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%ld",error.code]];
        }
        [SVProgressHUD dismiss];
    }];
}
@end
