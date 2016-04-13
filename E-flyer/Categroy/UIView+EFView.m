//
//  UIView+EFView.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "UIView+EFView.h"

@implementation UIView (EFView)
@dynamic x;
@dynamic y;
@dynamic width;
@dynamic height;

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

-(CGFloat)x{
    return self.frame.origin.x;
}
-(CGFloat)y{
    return self.frame.origin.y;
}

- (CGFloat)width{
    return self.bounds.size.width;
}

- (CGFloat)height{
    return self.bounds.size.height;
}
@end
