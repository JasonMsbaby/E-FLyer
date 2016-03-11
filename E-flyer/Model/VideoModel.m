//
//  VideoModel.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "VideoModel.h"
#import "DataManger.h"
#import "SVProgressHUD.h"

@implementation VideoModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"description"]) {
        self.des = value;
    }
}
/*!
 *  获取视频列表
 *
 *  @return 返回视频列表对象集合
 */
+(void)videoList:(void(^)(NSArray<VideoModel *> *result))success error:(void(^)(NSError *err))error{
    NSMutableArray *data = [NSMutableArray array];
    [SVProgressHUD show];
    [DataManger doGet:@"http://c.m.163.com/nc/video/home/0-10.html" success:^(NSDictionary *result) {
        NSArray *arr = [result objectForKey:@"videoList"];
        NSLog(@"%@",arr);
        for (NSDictionary *dic in arr) {
            VideoModel *model = [[VideoModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [data addObject:model];
        }
        [SVProgressHUD dismiss];
        success(data);
    } failed:^(NSError *er) {
        NSLog(@"%@",error);
        [SVProgressHUD dismiss];
        error(er);
    }];
}
@end
