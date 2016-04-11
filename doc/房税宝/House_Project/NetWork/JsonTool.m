//
//  JsonTool.m
//  HouseProject
//
//  Created by lanou3g on 14-10-8.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "JsonTool.h"
#import "Reachability.h"
@implementation JsonTool


#pragma mark --判断当前网络状态
- (NSInteger)isConnectionAvailable
{
    NSInteger isConnection = 0;
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.code4app.com"];
    switch ([reachability currentReachabilityStatus]) {
        case NotReachable:
            isConnection = 0;
            break;
        case ReachableViaWiFi:
            isConnection = 1;
            break;
        case ReachableViaWWAN:
            isConnection = 2;
            break;
    }
    return  isConnection;
}
#pragma mark --提示当前网络状态
- (void)connectionAlert:(NSInteger)flag
{
    if(flag == 0){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"小提示" message:@"无法链接网络,请检查网络设置" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }
}
#pragma mark -- 网络请求
- (void)JsonDictionaryWithURL:(NSString *)URL andBlock:(Block)datablock
{
    NSInteger isConnection = [self isConnectionAvailable];
    [self connectionAlert:isConnection];
    if(isConnection == 0){
        return;
    }
    //网络数据请求
    NSURL *url = [[NSURL alloc]initWithString:URL];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data != nil) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
            //调用block，返回解析字典
            datablock(dic);
        }
       
    }];
    [request release];
    [url release];
   
}
 
@end
