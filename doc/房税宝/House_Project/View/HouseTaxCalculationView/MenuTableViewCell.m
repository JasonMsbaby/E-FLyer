//
//  MenuTableViewCell.m
//  Qiubai
//
//  Created by lanou3g on 14-10-14.
//  Copyright (c) 2014年 lanou. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell
- (void)dealloc
{
    self.imgView = nil;
    self.txtLabel = nil;
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 图片
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 0, 30, 30)];
        self.imgView = imgView;
        [self addSubview:imgView];
        [imgView release];
        
        
        // 文本
        UILabel *txtLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 150, 30)];
        self.txtLabel = txtLabel;
        [self addSubview:txtLabel];
        [txtLabel release];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
