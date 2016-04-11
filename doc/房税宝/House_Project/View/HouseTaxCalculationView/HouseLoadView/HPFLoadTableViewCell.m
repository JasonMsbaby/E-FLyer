//
//  HPFLoadTableViewCell.m
//  House_Project
//
//  Created by lanou3g on 14-10-26.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HPFLoadTableViewCell.h"
#import "resultUITextFiled.h"
@implementation HPFLoadTableViewCell
- (void)dealloc
{
    [_HPFLModelArray release];
    [_textFiled release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UITextField * textFiled = [[UITextField alloc]initWithFrame:CGRectMake(5, 3, self.contentView.bounds.size.width- 10, 800)];
        self.textFiled = textFiled;
        self.textFiled.enabled = NO;
        self.textFiled.borderStyle = UITextBorderStyleRoundedRect;
        [self.contentView addSubview:self.textFiled];
        [textFiled release];

    }
    return self;
}
- (void)setHPFLModelArray:(NSMutableArray *)HPFLModelArray
{
    NSArray *inforArray  =[NSArray arrayWithObjects:@"婚姻状况",@"个人月缴存额",@"配偶月缴存额",@"房屋评估值(元)",@"房屋面积（平米）",@"按揭成数",@"按揭年数",@"年贷款利率分类",@"年利率（%）",@"月供款额（元）",@"评估值可贷款数（元）",@"评估值月还款(元)",@"月缴存可贷款数（元）",@"月缴存月还款(元)",@"可贷款数（元）",@"月还款(元)",nil];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, self.contentView.bounds.size.width- 20, 30)];
    label.text = @"公积金贷款计算结果详情页";
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
        label.text = [HPFLModelArray objectAtIndex:i];
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
