//
//  List2TableViewCell.m
//  House_Project
//
//  Created by lanou3g on 14-10-13.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "List2TableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation List2TableViewCell
-(void)dealloc
{
    [_leftImageView release];
    [_titleLable release];
    [_digestLable release];
    [_houseListModel release];
    [super dealloc];
    

}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * imagev = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7, 85, 66)];
        self.leftImageView = imagev;
        
        [self.contentView addSubview:imagev];
        [imagev release];
        
        
        UILabel * lable1 = [[UILabel alloc]initWithFrame:CGRectMake(105, 5,205, 25)];
        lable1.font = [UIFont systemFontOfSize:14];
        self.titleLable = lable1;
        [self.contentView addSubview:lable1];
        [lable1 release];
        
        
        UILabel * lable2 = [[UILabel alloc]initWithFrame:CGRectMake(105, 30,205, 50)];
        lable2.font = [UIFont systemFontOfSize:13];
        lable2.textColor = [UIColor grayColor];
        self.digestLable = lable2;
        lable2.lineBreakMode = NSLineBreakByWordWrapping;
        lable2.numberOfLines = 2;
        [self.contentView addSubview:lable2];
        [lable2 release];
        

    }
    return self;
}

-(void)setHouseListModel:(HouseListModel *)houseListModel
{
    [self.leftImageView setImageWithURL:[NSURL URLWithString:houseListModel.imgsrc] placeholderImage:[UIImage imageNamed:@"houseInforBackgroundImage.png"]];
    self.titleLable.text = houseListModel.title;
    self.digestLable.text = houseListModel.digest;

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
