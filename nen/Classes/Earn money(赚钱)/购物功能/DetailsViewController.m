//
//  DetailsViewController.m
//  nen
//
//  Created by nenios101 on 2017/3/6.
//  Copyright © 2017年 nen. All rights reserved.
//

#import "DetailsViewController.h"
#import "DetailsHeadView.h"
#import "DetailsMidstView.h"
#import "DetailsBottomView.h"
#import "ModalView.h"
#import "TheOrderViewController.h"


@interface DetailsViewController ()

@property(nonatomic,strong) DetailsHeadView *detailsView;

@property(nonatomic,strong) DetailsMidstView *detailsMidstView;

@property(nonatomic,strong) DetailsBottomView *detailsBottomView;

@property(nonatomic,strong) UIScrollView *scrollView;

@property(nonnull,strong) ModalView *modalView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addScrollView];
    
    [self addHeadView];
    
    [self addMidsdtView];
    
    [self addBottomView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modalView:) name:@"modalView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeBtn) name:@"close" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(confirmBtn) name:@"confirm" object:nil];
}


-(void)modalView:(NSNotification*)notification
{
    
    _modalView = [[[NSBundle mainBundle] loadNibNamed:@"ModalView" owner:nil options:nil] lastObject];
    _modalView.frame = CGRectMake(0,ScreenHeight - 310, ScreenWidth,310);
    [self.view addSubview:_modalView];
    
}

 - (void)closeBtn
{
    [_modalView removeFromSuperview];
}

- (void)confirmBtn
{
    [self.navigationController pushViewController:[[TheOrderViewController alloc] init] animated:YES];
}

- (void)addScrollView
{
    UIScrollView *scrVc = [[UIScrollView alloc] init];
    self.scrollView = scrVc;
    scrVc.frame = CGRectMake(0, 99,ScreenWidth,ScreenHeight - 150);
    [self.view addSubview:scrVc];
    scrVc.bounces = NO;
    self.scrollView.backgroundColor = [UIColor orangeColor];
    
}

-(void)addHeadView
{
    _detailsView = [[[NSBundle mainBundle] loadNibNamed:@"DetailsHeadView" owner:nil options:nil] firstObject];
    
    _detailsView.frame = CGRectMake(0, 5, ScreenWidth,310);
    
    [self.scrollView addSubview:_detailsView];
}


- (void)addMidsdtView
{
    _detailsMidstView = [[[NSBundle mainBundle] loadNibNamed:@"DetailsMidstView" owner:nil options:nil] firstObject];
    
    _detailsMidstView.frame = CGRectMake(0, _detailsView.sh_bottom + 10, ScreenWidth,150);
    
    [self.scrollView addSubview:_detailsMidstView];
    
    self.scrollView.contentSize = CGSizeMake(0,_detailsMidstView.sh_bottom );
}

- (void)addBottomView
{
    _detailsBottomView = [[[NSBundle mainBundle] loadNibNamed:@"DetailsBottomView" owner:nil options:nil] firstObject];
    _detailsBottomView.frame = CGRectMake(0, ScreenHeight - 50,ScreenWidth,50);
    
    [self.view addSubview:_detailsBottomView];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
