//
//  MyDataTools.h
//  HouseEx
//
//  Created by lanou3g on 14-10-15.
//  Copyright (c) 2014年 邢君莉. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Block) (id param);


@interface MyDataTools : NSObject

- (void)dictionaryHistoryTrendDataWithUrlStr:(NSString *)urlStr WithSig:(NSString *)sig andBlock:(Block)dataBlock;

- (void)arrayHotAreaDataWithUrlStr:(NSString *)urlStr WithSig:(NSString *)sig andBlock:(Block)dataBlock;

@end
