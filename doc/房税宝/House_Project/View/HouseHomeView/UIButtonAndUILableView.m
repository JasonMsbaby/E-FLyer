//
//  UIButtonAndUILableView.m
//  House_Project
//
//  Created by lanou3g on 14-10-11.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "UIButtonAndUILableView.h"

@implementation UIButtonAndUILableView
-(void)dealloc
{
    [_label release];
    [_button release];
    [super dealloc];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
//自定义初始化方法（两个参数：图片，标题）
- (id)initWithFrame:(CGRect)frame andImageName:(NSString *)imagename andLabelName:(NSString *)labelname;
{
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //图标
        
        UIImageView * imageView =[[UIImageView alloc]init];
        imageView.frame = CGRectMake(0, 0, self.bounds.size.width,self.bounds.size.height-20);
        imageView.image = [UIImage imageNamed:imagename];
        [self addSubview:imageView];
        [imageView release];
        //标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.bounds.origin.x+5, imageView.frame.size.height, self.bounds.size.width- 10, 20)];
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = 8;
        label.shadowOffset =CGSizeMake(-0.1, -0.1);
        label.shadowColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:12];
        label.backgroundColor = [UIColor orangeColor];
        label.textColor = [UIColor blueColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.adjustsFontSizeToFitWidth = YES;
        label.text = labelname;
        [self addSubview:label];
        [label release];
        
        
        
    }
    return self;
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
