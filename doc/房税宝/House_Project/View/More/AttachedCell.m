//
//  AttachedCell.m
//  House_Project
//
//  Created by lanou3g on 14-11-6.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "AttachedCell.h"
#import "Util.h"
@implementation AttachedCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10,0,300,80)];
        label.numberOfLines = 0;
        self.label = label;
        label.font = [UIFont systemFontOfSize:12];
        label.backgroundColor = [ UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1 ];
        [self.contentView addSubview:label];
        [label release];
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
