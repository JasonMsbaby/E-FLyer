//
//  NSTimer+EFTimer.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/10.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "NSTimer+EFTimer.h"

@implementation NSTimer (EFTimer)
-(void)pause{
    
    if (![self isValid]) {
        return ;
    }
    
    [self setFireDate:[NSDate distantFuture]]; //如果给我一个期限，我希望是4001-01-01 00:00:00 +0000
    
    
}


-(void)resume{
    
    if (![self isValid]) {
        return ;
    }
    
    //[self setFireDate:[NSDate dateWithTimeIntervalSinceNow:0]];
    [self setFireDate:[NSDate date]];
    
}
@end
