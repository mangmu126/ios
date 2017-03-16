//
//  SHAllViewController.m
//  百思不得姐demo
//
//  Created by macbook pro on 16/10/15.
//  Copyright © 2016年 itcsas. All rights reserved.
//

#import "TempleHomeViewController.h"
#import "JZLCycleView.h"
#import "Presentation.h"
#import "UIView+SHextension.h"
#import "HostView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface TempleHomeViewController ()

@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) JZLCycleView *headPictureCarouselView;

@property(nonatomic,strong) Presentation *presentationView;
@property(nonatomic,strong) HostView *hostView;

@end


@implementation TempleHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrVc = [[UIScrollView alloc] init];
    scrVc.bounces = NO;
    self.scrollView = scrVc;
    scrVc.backgroundColor = [UIColor whiteColor];
    scrVc.frame = CGRectMake(0,99,ScreenWidth, ScreenHeight);
    [self.view addSubview:scrVc];
    [self addHeadView];
    [self addPresentation];
    [self addHostView];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%f",_hostView.sh_bottom);
    self.scrollView.contentSize = CGSizeMake(0,_hostView.sh_bottom + 99);
}

- (void)addHeadView
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
    
    headerView.frame = CGRectMake(0,0,ScreenWidth,200);
    
    [self.scrollView addSubview:headerView];
    
}

- (void)addPresentation
{
    _presentationView = [[[NSBundle mainBundle] loadNibNamed:@"Presentation" owner:nil options:nil] lastObject];
    _presentationView.backgroundColor = [UIColor blueColor];
    
    _presentationView.frame = CGRectMake(0,_headPictureCarouselView.sh_bottom, ScreenWidth, 250);
    
    [self.scrollView addSubview:_presentationView];
    
}

- (void)addHostView
{
    _hostView = [[[NSBundle mainBundle] loadNibNamed:@"HostView" owner:nil options:nil] lastObject];
    _hostView.frame = CGRectMake(0,_presentationView.sh_bottom + 5,ScreenWidth, 270);
    
    
    _hostView.backgroundColor = [UIColor orangeColor];
    [self.scrollView addSubview:_hostView];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

@end
