//
//  SHWordViewController.m
//  百思不得姐demo
//
//  Created by macbook pro on 16/10/15.
//  Copyright © 2016年 itcsas. All rights reserved.
//

#import "ActivityViewController.h"
#import "UIView+SHextension.h"
#import "JZLCycleView.h"
#import "ActivityView.h"
#import "SignUpChannelView.h"
@interface ActivityViewController ()

@property(nonatomic,strong) UIScrollView *scrollView;



// 最新动态
@property(nonatomic,strong) ActivityView *activityView;

// 图片轮播器
@property(nonatomic,strong) UIView *headView;

@property(nonatomic,strong) JZLCycleView *headPictureCarouselView;

// 报名通道
@property(nonatomic,strong)SignUpChannelView *signView;

@end

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addScrollView];

    [self addHeadView];
    
    [self addMiddleView];
    
    [self addSignView];
    
}


-(void)addScrollView
{
    UIScrollView *scrVc = [[UIScrollView alloc] init];
    self.scrollView = scrVc;
    scrVc.frame = CGRectMake(0, 99,ScreenWidth,ScreenHeight);
    scrVc.backgroundColor = [UIColor blueColor];
    scrVc.bounces = NO;
    [self.view addSubview:scrVc];
    
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
     self.scrollView.contentSize = CGSizeMake(0,_signView.sh_bottom + 99);
}

- (void)addHeadView
{
    _headView = [[UIView alloc] init];

    // 图片轮播器
    NSMutableArray *arrTemp = [NSMutableArray array];
    for (NSInteger i = 1; i < 5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%ld",@"car",(long)i]];
        [arrTemp addObject:image];
    }
    _headPictureCarouselView = [JZLCycleView cycleCollectionViewWithFrame:CGRectMake(0,0, ScreenWidth,200) imageArray:arrTemp PlaceholderImage:[UIImage imageNamed:@"placeholderImage"]];
    [_headView addSubview:_headPictureCarouselView];
    
    _headView.frame = CGRectMake(0,0,ScreenWidth,200);
    
    [self.scrollView addSubview:_headView];
    
}

- (void)addMiddleView
{
    _activityView  = [[[NSBundle mainBundle] loadNibNamed:@"ActivtyView" owner:nil options:nil] lastObject];
    _activityView.frame = CGRectMake(0,_headView.sh_bottom,ScreenWidth,280);
    
    [self.scrollView addSubview:_activityView];
    
}

- (void)addSignView
{
    _signView = [[[NSBundle mainBundle] loadNibNamed:@"SignUpChannelView" owner:nil options:nil] lastObject];
    _signView.frame = CGRectMake(0,_activityView.sh_bottom,ScreenWidth,250);
    
    [self.scrollView addSubview:_signView];
}


@end
