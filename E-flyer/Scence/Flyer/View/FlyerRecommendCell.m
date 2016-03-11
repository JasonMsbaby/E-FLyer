//
//  FlyerRecommendCell.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/1.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "FlyerRecommendCell.h"
#import "Constanst.h"

@interface FlyerRecommendCell ()
@property(strong,nonatomic) UIScrollView *scrollView;
@end

@implementation FlyerRecommendCell

/*!
 *  @author Jason_Msbaby, 16-03-01 11:03:09
 *
 *  布局
 */
- (void)layout{
    if(self.scrollView == nil){
        CGFloat h = 150;
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, h)];
        self.scrollView.contentSize = CGSizeMake(kScreenWidth*2, h);
        for (int i = 0; i < 6; i++) {
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(i*kScreenWidth/3, 0, kScreenWidth/3, h)];
            imgView.image = [UIImage imageNamed:@"img"];
            [self.scrollView addSubview:imgView];
        }
        [self addSubview:self.scrollView];
    }
    
}
@end
