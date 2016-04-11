//
//  List3TableViewCell.m
//  House_Project
//
//  Created by lanou3g on 14-10-13.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "List3TableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation List3TableViewCell
-(void)dealloc
{
    [_titleLabel release];
    [_leftImageView release];
    [_middleImageView release];
    [_rightImageView release];
    [_houseListModelTwo release];
    [super dealloc];
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 7, 300, 25)];
        self.titleLabel = label;
        label.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:label];
        [label release];
        
        
        UIImageView * imagev = [[UIImageView alloc]initWithFrame:CGRectMake(10, 37, 96.667, 75)];
        self.leftImageView = imagev;
        [self.contentView addSubview:imagev];
        [imagev release];
        
        
        
        UIImageView * imagev2 = [[UIImageView alloc]initWithFrame:CGRectMake(111.667, 37, 96.667, 75)];
        self.middleImageView = imagev2;
        [self.contentView addSubview:imagev2];
        [imagev2 release];
        
        
        
        UIImageView * imagev3 = [[UIImageView alloc]initWithFrame:CGRectMake(213.333, 37, 96.667, 75)];
        self.rightImageView = imagev3;
        [self.contentView addSubview:imagev3];
        [imagev3 release];
    }
    return self;
}

-(void)setHouseListModelTwo:(HouseListModelTwo *)houseListModelTwo
{
    self.titleLabel.text = houseListModelTwo.title;
    [self.leftImageView setImageWithURL:[NSURL URLWithString:houseListModelTwo.imgsrc] placeholderImage:[UIImage imageNamed:@"houseInforBackgroundImage.png"]];
    
    [self.middleImageView setImageWithURL:[NSURL URLWithString:houseListModelTwo.middleImageViewStr]];
    [self.rightImageView setImageWithURL:[NSURL URLWithString:houseListModelTwo.rightImageViewStr]];


    
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
