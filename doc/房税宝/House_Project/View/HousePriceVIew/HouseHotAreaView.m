//
//  HouseHotAreaView.m
//  HouseProject2
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 邢君莉. All rights reserved.
//

#import "HouseHotAreaView.h"
#import "HouseHeader.h"

@implementation HouseHotAreaView

-(void)dealloc
{

    [_citiesArray release];
    [_inserestLevelDataArray release];
    [_housePriceDataArray release];
    [_hotAreaView release];
    [_btn release];
    [_appendView release];
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



- (id)initWithFrame:(CGRect)frame andHotAreaArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIScrollView * hotAreaScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight*2)];
        [self addSubview:hotAreaScrollView];
        
        
        UILabel * interestLevelLabel=[[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/2-60, 0, 60, 30)];
        [hotAreaScrollView addSubview:interestLevelLabel];
        interestLevelLabel.font=[UIFont systemFontOfSize:14];
        interestLevelLabel.textColor=[UIColor lightGrayColor];
        
        interestLevelLabel.textAlignment=NSTextAlignmentRight;
        interestLevelLabel.text=@"关注度";
        [interestLevelLabel release];
        
        UILabel * housePriceLabel=[[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/2+20, 0, 60, 30)];
        [hotAreaScrollView addSubview:housePriceLabel];
        housePriceLabel.font=[UIFont systemFontOfSize:14];
        housePriceLabel.textColor=[UIColor lightGrayColor];
        housePriceLabel.text=@"房价";
        [housePriceLabel release];
        
        
        
        self.citiesArray=[[[NSMutableArray alloc]init] autorelease];
        self.inserestLevelDataArray=[[[NSMutableArray alloc]init]autorelease];
        self.housePriceDataArray=[[[NSMutableArray alloc]init]autorelease];
        for (NSDictionary * temDic in array) {
            
            NSString * region_name = [temDic objectForKey:@"region_name"];
            NSString * region_heat  = [temDic objectForKey:@"region_heat"];
            NSString * avg_price  = [temDic objectForKey:@"avg_price"];
            
            [_citiesArray addObject:region_name];
            [_inserestLevelDataArray addObject:region_heat];
            [_housePriceDataArray addObject:avg_price];
        }
        
        
        
        for (int i=0; i<_citiesArray.count; i++) {
            HotAreaView *  hotAreaView=[[HotAreaView alloc]initWithFrame:CGRectMake(0, 25+i*35, ScreenWidth, 30) andRegion_name:[_citiesArray objectAtIndex:i] andRegion_heat:[_inserestLevelDataArray objectAtIndex:i] andAvg_price:[_housePriceDataArray objectAtIndex:i]];
            if (i%2 == 0) {
                hotAreaView.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
            }
            [hotAreaScrollView addSubview:hotAreaView];
            self.hotAreaView=hotAreaView;
            self.hotAreaView.delegate=self;
            [hotAreaView release];
            [self action];
            
         
            
        }
        
        [hotAreaScrollView release];
        
        
    }
    
    
    return self;
}

- (void)action
{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:0.1];
    [UIView setAnimationDuration:2.5];
    [self.hotAreaView.region_heatProgressView setProgress:1 animated:YES];
    [self.hotAreaView.avg_priceProgressView setProgress:1 animated:YES];
    [UIView commitAnimations];
    
    
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


