//
//  List1TableViewCell.m
//  House_Project
//
//  Created by lanou3g on 14-10-13.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "List1TableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation List1TableViewCell
-(void)dealloc
{
    [_imagv release];
    [_label release];
    [_houseListTopModel release];
    [super dealloc];
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        
        UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 310, 180)];
        [self.contentView addSubview:imageview];
        self.imagv = imageview;
        
        [imageview release];
        

        
        UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 185, 200, 20)];
        lable.font = [UIFont systemFontOfSize:13];
        self.label =lable;
        [self.contentView addSubview:lable];
        [lable release];

    }
    return self;
}

-(void)setHouseListTopModel:(HouseLIstTopModel *)houseListTopModel
{
   
    
    [self.imagv setImageWithURL:[NSURL URLWithString:houseListTopModel.imgsrc] placeholderImage:[UIImage imageNamed:@"houseInforBackgroundImage.png"]];
    //[self.imagv setImageWithURL:[NSURL URLWithString:houseListTopModel.imgsrc]];
    self.label.text = houseListTopModel.title;
    
  
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
