//
//  ToolUtils.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "ToolUtils.h"

@implementation ToolUtils

+ (NSString *)randomUUID{
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    CFRelease(uuidStringRef);
    NSString *uniqueID =  [NSString stringWithFormat:@"%@",uuidStringRef];
    return uniqueID;
}
@end
