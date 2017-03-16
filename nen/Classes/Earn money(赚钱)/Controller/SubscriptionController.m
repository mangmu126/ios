//
//  SubscriptionController.m
//  nen
//
//  Created by nenios101 on 2017/3/1.
//  Copyright © 2017年 nen. All rights reserved.
// 认购区

#import "SubscriptionController.h"
#import "JZLCycleView.h"
#import "YFRollingLabel.h"
#import "CurrencyView.h"
#import "subscrpitCell.h"
#import "ShoppingViewController.h"

@interface SubscriptionController ()<UITableViewDelegate>
// 图片轮播器
@property (nonatomic, weak) JZLCycleView *headPictureCarouselView;

// 跑马灯文本
@property (nonatomic, strong) YFRollingLabel *horseRaceLampLabel;

@end

@implementation SubscriptionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35 , 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.tableHeaderView = nil;
    
    self.tableView.rowHeight = 220;
    self.tableView.tableHeaderView = [self headView];

}

// 返回tableView头部

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
    
    //    // 跑马灯
    UIView *horseRaceLamp = [[UIView  alloc] initWithFrame:CGRectMake(0,200,ScreenWidth , 25)];
    
    //添加文字内容
    NSArray *textArray = @[@"THIS IS THE FIRST TEXT",
                           @"THIS IS THE FIRST TEXTYY"
                           ];
    
    self.horseRaceLampLabel = [[YFRollingLabel alloc] initWithFrame:CGRectMake(0,200, self.view.frame.size.width, 25)  textArray:textArray font:[UIFont systemFontOfSize:15] textColor:[UIColor whiteColor]];
    [horseRaceLamp addSubview:self.horseRaceLampLabel];
    self.horseRaceLampLabel.backgroundColor = [UIColor orangeColor];
    self.horseRaceLampLabel.speed = 2;
    [self.horseRaceLampLabel setOrientation:RollingOrientationLeft];
    [self.horseRaceLampLabel setInternalWidth:self.horseRaceLampLabel.frame.size.width / 3];;
    
    // 获取文字点击文字点击
    self.horseRaceLampLabel.labelClickBlock = ^(NSInteger index){
        NSString *text = [textArray objectAtIndex:index];
        NSLog(@"You Tapped item:%li , and the text is %@",(long)index,text);
    };
    [headerView addSubview:self.horseRaceLampLabel];
    
    
    // 底部图片
    UIView *buttonImage = [[UIView alloc] initWithFrame:CGRectMake(0,self.horseRaceLampLabel.sh_bottom,[UIScreen mainScreen].bounds.size.width,80)];
    
    UIImageView *leftImageView = [[UIImageView alloc] init];
    leftImageView.sh_x = 10;
    leftImageView.sh_height = buttonImage.sh_height;
    leftImageView.sh_y = 0;
    leftImageView.sh_width = ScreenWidth *0.4;
    leftImageView.image = [UIImage imageNamed:@"car1"];
    
    UIImageView *rightImageView = [[UIImageView alloc] init];
    rightImageView.sh_width = ScreenWidth * 0.5;
    rightImageView.sh_x = (ScreenWidth * 0.5) - 10;
    rightImageView.sh_height = buttonImage.sh_height;
    rightImageView.image = [UIImage imageNamed:@"car1"];
    
    [buttonImage addSubview:leftImageView];
    [buttonImage addSubview:rightImageView];
    
    [headerView addSubview:buttonImage];
    
    CurrencyView *currency = [CurrencyView currencyViewWithYvalue:buttonImage.sh_bottom LeftTitle:@"精品推荐" andRightTitle:@""];
    
    [headerView addSubview:currency];
    
    headerView.sh_height = 325;
    headerView.sh_x = 0;
    headerView.sh_y = - 99;
    headerView.sh_width = ScreenWidth;
    
    return headerView;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShoppingViewController *shop = [[ShoppingViewController alloc] init];
    
    [self.navigationController pushViewController:shop animated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.确定重用标示:
    static NSString *ID = @"cell";
    
    
    subscrpitCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"subscrpitCell" owner:nil options:nil] lastObject];
        
    }
    
   // cell.textLabel.text = [NSString stringWithFormat:@"%@ - %zd", [self class], indexPath.row];
    
    return cell;
}



@end
