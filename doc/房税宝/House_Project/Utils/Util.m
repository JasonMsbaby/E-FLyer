//
//  Util.m
//  House_Project
//
//  Created by lanou3g on 14-11-7.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "Util.h"

@implementation Util


@end
#pragma mark UILabel
@implementation UILabel (andy)
- (CGRect)adjustFrameHeightToAdaptiveWithMaxHeight:(CGFloat)maxHeight {
	CGRect rect = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, maxHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil];
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, rect.size.height);
	return self.frame;
}
- (void)boldFont {
	self.font = [UIFont boldSystemFontOfSize:self.font.pointSize];
}
@end
