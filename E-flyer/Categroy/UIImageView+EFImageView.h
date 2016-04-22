//
//  UIImageView+EFImageView.h
//  E-flyer
//
//  Created by 苗爽 on 16/4/21.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <AVOSCloud.h>
#import <UIKit/UIKit.h>

@interface UIImageView (EFImageView)

- (void)imagedWithAVFile:(AVFile *)file;


- (void)setCornerRadius:(CGFloat)radius;

@end
