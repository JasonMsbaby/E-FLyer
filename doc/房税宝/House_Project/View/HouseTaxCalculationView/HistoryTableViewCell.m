//
//  HistoryTableViewCell.m
//  House_Project
//
//  Created by lanou3g on 14-10-21.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HistoryTableViewCell.h"
#import "resultUITextFiled.h"
@implementation HistoryTableViewCell
- (void)dealloc
{
    [_inforModelArray release];
    [_resultModelArray release];
   [_textFiled release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.contentView.backgroundColor = [UIColor whiteColor];
        UITextField * textFiled = [[UITextField alloc]initWithFrame:CGRectMake(5, 3, self.contentView.bounds.size.width- 10, 800)];
        self.textFiled = textFiled;
        self.textFiled.enabled = NO;
        self.textFiled.borderStyle = UITextBorderStyleRoundedRect;
        [self.contentView addSubview:self.textFiled];
        [textFiled release];
    }
    return self;
}

-(void)setInforModelArray:(NSMutableArray *)inforModelArray
{
     NSArray *inforArray  =[NSArray arrayWithObjects: @"成交价(万元)",@"网签价(万元)",@"原值(万元)",@"所售住房面积（平米）",@"卖方：现有住房(套)",@"所售住房性质",@"所售住房购买年限", @"买方：现有住房(套)",@"贷款类型",@"贷款金额（万元）",@"中介服务费百分比（%）",nil];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, self.contentView.bounds.size.width- 20, 30)];
    label.text = @"房源信息";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:235/255.0 green:155/255.0 blue:0 alpha:1];
    label.font = [UIFont systemFontOfSize:12];
    label.adjustsFontSizeToFitWidth = YES;
    [self.textFiled addSubview:label];
    [label release];
 
    //信息初始化界面
    for (int i = 0; i< inforArray.count; i++) {
        resultUITextFiled *taxResuleTF = [[resultUITextFiled  alloc] initWithFrame:CGRectMake(5, 40+i*30,self.contentView.bounds.size.width-20, 30) andTaxTitle:[inforArray objectAtIndex:i]];
        [self.textFiled addSubview: taxResuleTF];
        taxResuleTF.optionLabel.font = [UIFont systemFontOfSize:12];
         taxResuleTF.unitLabel.font = [UIFont systemFontOfSize:12];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15+taxResuleTF.bounds.size.width/2, 40+i*30+taxResuleTF.bounds.size.height/5, taxResuleTF.bounds.size.width/3, taxResuleTF.bounds.size.height*3/5)];
        label.layer.cornerRadius = 5.0;
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment =  NSTextAlignmentRight;
        label.text = [inforModelArray objectAtIndex:i];
        //属性设置
        label.adjustsFontSizeToFitWidth = YES;
        [self.textFiled addSubview:label];
        [label release];
        [taxResuleTF release];
    }
  
   

}
- (void)setResultModelArray:(NSMutableArray *)resultModelArray
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 370, self.contentView.bounds.size.width- 20, 30)];
    label.font= [UIFont systemFontOfSize:12];
    label.backgroundColor = [UIColor colorWithRed:235/255.0 green:155/255.0 blue:0 alpha:1];
    label.text = @"房税";
     label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.adjustsFontSizeToFitWidth = YES;
    [self.textFiled addSubview:label];
    [label release];
    //数组
    NSArray *resultArray = [NSArray arrayWithObjects:@"原值(万元)",@"成交价（万元）",@"底价",@"契税（元）",@"个税（元）",@"营业税（元）",@"土地出让金（元）",@"中介服务费（元）",@"代办过户（元）",@"代办交验（元）",@"代办审批（元）",@"贷款代办费（元）",@"房税总价（元）", nil];

    //结果初始化界面
    for (int i = 0; i< resultArray.count; i++) {
        resultUITextFiled *taxResuleTF = [[resultUITextFiled  alloc] initWithFrame:CGRectMake(5, 400+i*30, self.contentView.bounds.size.width-20, 30) andTaxTitle:[resultArray objectAtIndex:i]];
        taxResuleTF.optionLabel.font= [UIFont systemFontOfSize:12];
        taxResuleTF.unitLabel.font= [UIFont systemFontOfSize:12];
        [self.textFiled addSubview: taxResuleTF];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15+taxResuleTF.bounds.size.width/2, 400+i*30+taxResuleTF.bounds.size.height/5, taxResuleTF.bounds.size.width/3, taxResuleTF.bounds.size.height*3/5)];
        label.font = [UIFont systemFontOfSize:13];
        label.layer.cornerRadius = 5.0;
        label.textAlignment =  NSTextAlignmentRight;
        label.text = [resultModelArray objectAtIndex:i];
        //属性设置
        label.adjustsFontSizeToFitWidth = YES;
        [self.textFiled addSubview:label];
        [label release];
        [taxResuleTF release];
    }
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
