//
//  HistoryListTableViewCell.m
//  House_Project
//
//  Created by lanou3g on 14-10-21.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HistoryListTableViewCell.h"

@implementation HistoryListTableViewCell
- (void)dealloc
{
    [_dateLabel release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 30, 30)];
        imgView.layer.cornerRadius = 10.0;
        imgView.image = [UIImage imageNamed:@"calculate2"];
        [self.contentView addSubview:imgView];
        [imgView release];
         UILabel * dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, 270, 40)];
        self.dateLabel = dateLabel;
        self.dateLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.dateLabel];
        [dateLabel release];
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
