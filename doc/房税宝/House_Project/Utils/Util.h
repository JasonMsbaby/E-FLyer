//
//  Util.h
//  House_Project
//
//  Created by lanou3g on 14-11-7.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject

@end
#pragma mark - 类目
#pragma mark - UILabel
@interface UILabel (andy)
/** @brief 调整label的frame为自适应文字高度（可指定最大高度）*/
- (CGRect)adjustFrameHeightToAdaptiveWithMaxHeight:(CGFloat)maxHeight;

/** @brief 调整系统字体为系统粗体*/
- (void)boldFont;
@end
