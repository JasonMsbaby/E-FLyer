//
//  BEMCircle.m
//  SimpleLineGraph
//
//  Created by Bobo on 12/27/13.
//  Copyright (c) 2013 Boris Emorine. All rights reserved.
//

#import "BEMCircle.h"

@implementation BEMCircle
- (void)dealloc
{
    [_backRectView release];
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        UIView *view = [[UIView alloc]initWithFrame:frame];
        self.backRectView = view;
        view.layer.cornerRadius = frame.size.width/2;
       view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        [view release];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, rect);
   //[[UIColor yellowColor] set];

    CGContextFillPath(ctx);
}

@end