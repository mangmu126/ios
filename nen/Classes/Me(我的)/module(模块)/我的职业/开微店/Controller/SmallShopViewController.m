//
//  SmallShopViewController.m
//  nen
//
//  Created by nenios101 on 2017/3/9.
//  Copyright © 2017年 nen. All rights reserved.
//

#import "SmallShopViewController.h"
#import "SmallHeadView.h"
#import "SmallContentView.h"
#import "GoodsManagementViewController.h"
#import "BootomViewController.h"
#import "MessageViewController.h"
#import "IncomeTableViewController.h"
#import "MyShopController.h"
#import "ShopSetDecorateController.h"
@interface SmallShopViewController ()

@property(nonatomic,strong) SmallHeadView *headView;

@property(nonatomic,strong) UIScrollView *scrollView;

@property(nonatomic,strong) SmallContentView *smallContentView;

@property(nonatomic,strong) UIButton *btn;

@end

@implementation SmallShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addScrollview];
    
    [self addHeadView];
    
    [self addContenView];
    
    [self addBtn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goodsBtn) name:@"goods" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orderBtn) name:@"order" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(messageBtn) name:@"message" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(incomeBtn) name:@"income" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shopBtn) name:@"shop" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(decorateBtn) name:@"decorate" object:nil];
}

#pragma mark 商品管理通知

-(void)goodsBtn
{
    [self.navigationController pushViewController:[GoodsManagementViewController new] animated:YES];
}
#pragma mark 订单管理通知
-(void)orderBtn
{
    [self.navigationController pushViewController:[BootomViewController new] animated:YES];
}
#pragma mark 订单管理通知
-(void)messageBtn
{
    [self.navigationController pushViewController:[MessageViewController new] animated:YES];
}

#pragma mark 店铺收入通知
-(void)incomeBtn
{
    [self.navigationController pushViewController:[IncomeTableViewController new] animated:YES];
}
#pragma mark 我的店铺通知
-(void)shopBtn
{
    [self.navigationController pushViewController:[MyShopController new] animated:YES];
}

#pragma mark 店铺装修通知
-(void)decorateBtn
{
    [self.navigationController pushViewController:[ShopSetDecorateController new] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}


- (void)addScrollview
{
    UIScrollView *scrVc = [[UIScrollView alloc] init];
    self.scrollView = scrVc;
    scrVc.backgroundColor = [UIColor greenColor];
    scrVc.frame = self.view.frame;
    [self.view addSubview:scrVc];
}

- (void)addHeadView
{
    _headView = [[[NSBundle mainBundle] loadNibNamed:@"SmallHeadView" owner:nil options:nil] lastObject];
    _headView.frame = CGRectMake(0, 0, ScreenWidth, 230);
    [self.scrollView addSubview:_headView];
}

- (void)addContenView
{
    _smallContentView = [[[NSBundle mainBundle] loadNibNamed:@"SmallContentView" owner:nil options:nil] lastObject];
    _smallContentView.frame = CGRectMake(0, _headView.sh_bottom + 10, ScreenWidth, 180);
    [self.scrollView addSubview:_smallContentView];
}

- (void)addBtn
{
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(ScreenWidth * 0.1,_smallContentView.sh_bottom + 50,ScreenWidth * 0.8,30);
    [_btn setBackgroundColor:[UIColor orangeColor]];
    [_btn setTitle:@"发布话题" forState:UIControlStateNormal];
    _btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _btn.clipsToBounds = YES;
    _btn.layer.cornerRadius=5;
    [self.scrollView addSubview:_btn];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
