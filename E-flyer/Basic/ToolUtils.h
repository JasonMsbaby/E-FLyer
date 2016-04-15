//
//  ToolUtils.h
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVOSCloud.h>
@interface ToolUtils : NSObject
/*!
 *  获取唯一字符串
 *
 *  @return 返回唯一字符串
 */
+ (NSString *)randomUUID;
/*!
 *  根据视频地址获取视频的某个时间的图片
 *
 *  @param videoURL 视频地址
 *  @param time     时间
 *
 *  @return
 */
+ (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;

+ (AVFile *)dataWithImage:(UIImage *)image VideoPath:(NSString *)path;

+ (NSString *)StringWithDate:(NSDate *)d;

@end
