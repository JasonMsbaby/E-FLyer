//
//  DataManger.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^onSuccess)(NSDictionary *result);
typedef void(^onFailed)(NSError *error);
@interface DataManger : NSObject

+ (void)doGet:(NSString *)url success:(onSuccess)success failed:(onFailed)failed;


@end
