//
//  BuddhismTableViewController.m
//  test
//
//  Created by nenios101 on 2017/3/3.
//  Copyright © 2017年 nen. All rights reserved.
//佛教

#import "BuddhismTableViewController.h"
#import "JZLCycleView.h"
#import "TempleViewController.h"

@interface BuddhismTableViewController ()<UITableViewDelegate>

// 图片轮播器
@property (nonatomic, weak) JZLCycleView *headPictureCarouselView;


@end

@implementation BuddhismTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
     self.tableView.tableHeaderView = [self headView];
    self.tableView.rowHeight = 250;
}


- (UIView *)headView
{
    UIView *headerView = [[UIView alloc] init];
    // 图片轮播器
    NSMutableArray *arrTemp = [NSMutableArray array];
    for (NSInteger i = 1; i < 5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%ld",@"car",(long)i]];
        [arrTemp addObject:image];
    }
    _headPictureCarouselView = [JZLCycleView cycleCollectionViewWithFrame:CGRectMake(0,0, ScreenWidth,200) imageArray:arrTemp PlaceholderImage:[UIImage imageNamed:@"placeholderImage"]];
    [headerView addSubview:_headPictureCarouselView];
    
    UIView *placeNameView = [[UIView alloc] init];
    placeNameView.sh_y = _headPictureCarouselView.sh_bottom + 5;
    placeNameView.sh_height = 26;
    placeNameView.sh_width = ScreenWidth;
    placeNameView.sh_x = 0;
   
    [headerView addSubview:placeNameView];
    UILabel *leftName = [[UILabel alloc] init];
    leftName.text = @" 你所在的省份     V";
    leftName.font = [UIFont systemFontOfSize:13];
    leftName.sh_x = 5;
    leftName.tintColor = [UIColor blackColor];
    leftName.sh_y =0;
    leftName.sh_width = ScreenWidth * 0.3;
    leftName.sh_height = 25;
    [placeNameView addSubview:leftName];
    
    UILabel *rightName = [[UILabel alloc] init];
    rightName.text = @" 你所在的省份     V";
    rightName.font = [UIFont systemFontOfSize:13];
    rightName.sh_x = leftName.sh_right + 10;
    rightName.tintColor = [UIColor blackColor];
    rightName.sh_y =0;
    rightName.sh_width = ScreenWidth * 0.3;
    rightName.sh_height = 25;
    [placeNameView addSubview:rightName];
    
    UILabel *btn = [[UILabel alloc] init];
    btn.text = @"        切换";
    btn.font = [UIFont systemFontOfSize:13];
    btn.sh_x = rightName.sh_right + 10;
    btn.tintColor = [UIColor blackColor];
    btn.sh_y =0;
    btn.sh_width = ScreenWidth * 0.2;
    btn.sh_height = 25;
    [placeNameView addSubview:btn];
    
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = [UIColor grayColor];
    bottomLine.sh_height = 1;
    bottomLine.sh_width = ScreenWidth;
    bottomLine.sh_y =  placeNameView.sh_bottom;
    bottomLine.sh_x = 0;
    
    [headerView addSubview:bottomLine];
    
    headerView.sh_height = 235;
    headerView.sh_x = 0;
    headerView.sh_y = 0;
    headerView.sh_width = ScreenWidth;
    
    return headerView;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[[TempleViewController alloc] init] animated:YES];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.确定重用标示:
    static NSString *ID = @"cell";
    
    // 2.从缓存池中取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 3.如果空就手动创建
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BuddhismCell" owner:nil options:nil] lastObject];
    }
    
    
    return cell;
}

@end
