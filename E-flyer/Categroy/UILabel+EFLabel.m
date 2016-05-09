//
//  UILabel+EFLabel.m
//  E-flyer
//
//  Created by 张杰 on 16/5/9.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "UILabel+EFLabel.h"

@implementation UILabel (EFLabel)



- (instancetype)appendAttributeString:(NSString *)content FontSize:(NSInteger)size FontColor:(UIColor *)color WithWrapNumber:(NSInteger)number{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:content];
    NSMutableAttributedString *originStr = self.attributedText;
    if (originStr == nil) {
        originStr = [[NSMutableAttributedString alloc] initWithString:@""];
    }
    
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size] range:NSMakeRange(0, content.length)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, content.length)];
    
    [originStr appendAttributedString:attrStr];
    
    for (int i = 0; i < number; i++) {
        [originStr appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\n"]];
    }
    
    self.attributedText = originStr;
    
    return self;
}


@end
