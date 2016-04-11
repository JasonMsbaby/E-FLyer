//
//  MainCell.m
//  House_Project
//
//  Created by lanou3g on 14-11-6.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 120,20)];
        self.titleLabel = label;
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = [UIColor darkGrayColor];
        label.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:label];
        [label release];
        UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"area_filter_unfold@2x"]];
                                //initWithImage:[UIImage imageNamed:@"right.png"] highlightedImage:[UIImage imageNamed:@"right.png"]];
        self.imgView = imgView;
        imgView.frame = CGRectMake(294, 15, 16, 10);
        [self.contentView addSubview:imgView];
        [imgView release];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
