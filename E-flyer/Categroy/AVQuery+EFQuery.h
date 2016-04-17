//
//  AVQuery+EFQuery.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "AVQuery.h"
typedef void(^success)(NSArray *result);
@interface AVQuery (EFQuery)


- (void)findObjectsInBackgroundWithSuccess:(success)success;

- (void)findObjectsInForegroundWithSuccess:(success)success;

- (void)openCache;

@end
