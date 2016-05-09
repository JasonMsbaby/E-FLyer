//
//  UILabel+EFLabel.h
//  E-flyer
//
//  Created by 张杰 on 16/5/9.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (EFLabel)

/**
 *  添加属性字符串
 *
 *  @param content 内容
 *  @param size    字体大小
 *  @param color   字体颜色
 *  @param warp    换行个数  不换行则为0
 *  @return
 */
- (instancetype)appendAttributeString:(NSString *)content FontSize:(NSInteger)size FontColor:(UIColor *)color WithWrapNumber:(NSInteger)number;

@end
