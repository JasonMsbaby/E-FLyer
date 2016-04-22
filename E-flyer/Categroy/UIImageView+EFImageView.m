//
//  UIImageView+EFImageView.m
//  E-flyer
//
//  Created by 苗爽 on 16/4/21.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "UIImageView+EFImageView.h"

@implementation UIImageView (EFImageView)

- (void)imagedWithAVFile:(AVFile *)file{
    self.image = [UIImage imageWithData:[file getData]];
}


- (void)setCornerRadius:(CGFloat)radius{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = radius;
}

@end
