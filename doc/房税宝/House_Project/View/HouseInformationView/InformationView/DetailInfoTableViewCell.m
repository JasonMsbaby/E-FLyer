//
//  DetailInfoTableViewCell.m
//  House_Project
//
//  Created by lanou3g on 14-10-13.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "DetailInfoTableViewCell.h"



@implementation DetailInfoTableViewCell

-(void)dealloc
{
    [_webView release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320,380)];
        self.webView = webView;
        [self.contentView addSubview:webView];
        [webView release];
    }
    return self;
}




- (void)awakeFromNib
{
 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
