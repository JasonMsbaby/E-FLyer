//
//  MyDataTools.m
//  HouseEx
//
//  Created by lanou3g on 14-10-15.
//  Copyright (c) 2014年 邢君莉. All rights reserved.
//

#import "MyDataTools.h"
#import "JsonTool.h"
#define HousPrice_URL @"http://api.anjuke.com/anjuke/4.0/city/get?app=i-ajk&cid=-1&city_id=14&cv=8.0&from=mobile&i=02018C44-2BCC-4520-ADFA-201410071656&m=iPhone&macid=50dfdd92034dc6fc55417361a7d35922&o=iPhone%2520OS&ostype2=ios6&pm=A01&qtime=20141010161243&udid2=02018C44-2BCC-4520-ADFA-201410071656&uuid2=02018C44-2BCC-4520-ADFA-201410071656&uuid=02018C44-2BCC-4520-ADFA-201410071656&v=6.1.3"


#define HOUSE_PRICE_HOTAREA_URL @"http://api.anjuke.com/mobile/v5/ershou/prop/manage/regionHeat?app=i-ajk&cid=-1&city_id=14&cv=8.0&from=mobile&i=02018C44-2BCC-4520-ADFA-201410071656&m=iPhone&macid=50dfdd92034dc6fc55417361a7d35922&o=iPhone%2520OS&ostype2=ios6&pm=A01&qtime=20141010161243&udid2=02018C44-2BCC-4520-ADFA-201410071656&uuid2=02018C44-2BCC-4520-ADFA-201410071656&uuid=02018C44-2BCC-4520-ADFA-201410071656&v=6.1.3"

@implementation MyDataTools


////解析历史走势的数据
- (void)dictionaryHistoryTrendDataWithUrlStr:(NSString *)urlStr WithSig:(NSString *)sig andBlock:(Block)dataBlock
{

    JsonTool *jsonTool = [[[JsonTool alloc]init]autorelease];
    NSInteger isConnection = [jsonTool isConnectionAvailable];
    [jsonTool connectionAlert:isConnection];
    if(isConnection == 0){
        return;
    }
    NSURL * url = [[NSURL alloc]initWithString:urlStr];
    NSMutableURLRequest * request=[[NSMutableURLRequest alloc]initWithURL:url];
    [url release];
    
    [request addValue:@"d945dc04a511fcd7e6ee79d9bf4b9416" forHTTPHeaderField:@"key"];
    [request addValue:sig forHTTPHeaderField:@"sig"];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data != nil) {
            NSDictionary * temDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSDictionary * dic = [temDic objectForKey:@"results"];
            
            dataBlock(dic);
        }
       
        }];
    [request release];
   

}

//解析热门区域的数据
- (void)arrayHotAreaDataWithUrlStr:(NSString *)urlStr WithSig:(NSString *)sig andBlock:(Block)dataBlock
{
    
    JsonTool *jsonTool = [[[JsonTool alloc]init]autorelease];
    NSInteger isConnection = [jsonTool isConnectionAvailable];
    [jsonTool connectionAlert:isConnection];
    if(isConnection == 0){
        return;
    }
    NSURL * url = [[NSURL alloc]initWithString:urlStr];
    NSMutableURLRequest * request=[[NSMutableURLRequest alloc]initWithURL:url];
    [url release];
    
    [request addValue:@"d945dc04a511fcd7e6ee79d9bf4b9416" forHTTPHeaderField:@"key"];
    [request addValue:sig forHTTPHeaderField:@"sig"];
    
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data != nil) {
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSArray * array = [dic objectForKey:@"data"];
            dataBlock(array);

        }
        
    }];
    [request release];

    

}




@end
