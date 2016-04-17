//
//  FlyerListController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/17.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "FlyerListController.h"
#import "FlyerYouLikeCell.h"

@interface FlyerListController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSMutableArray<EFGood *> *dataSource;
@end

@implementation FlyerListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FlyerYouLikeCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FlyerYouLikeCell"];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}


@end
