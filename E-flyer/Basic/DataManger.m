//
//  DataManger.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "DataManger.h"

@interface DataManger ()

@end

@implementation DataManger


/*!
 *  单例
 *
 *  @return 返回实例变量
 */
+ (instancetype)sharedDataManger{
    static DataManger *dataManger = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataManger = [[DataManger alloc]init];
    });
    return  dataManger;
}

/*!
 *  发起Get请求
 *
 *  @param url     请求地址
 *  @param success 成功回调
 *  @param failed  失败回调
 */
+ (void)doGet:(NSString *)url success:(onSuccess)success failed:(onFailed)failed{
    NSURL *nsurl = [NSURL URLWithString:url];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:nsurl];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (error) {
                failed(error);
            }else{
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
                success(dic);
            }
        });
    }];
    [task resume];
}

@end
