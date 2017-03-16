//
//  TheOrderViewController.m
//  nen
//
//  Created by nenios101 on 2017/3/7.
//  Copyright © 2017年 nen. All rights reserved.
//

#import "TheOrderViewController.h"
#import "UIView+SHextension.h"
#import "TheOrderHeadView.h"
#import "TheOrderContentView.h"
#import "TheOrderBottomView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface TheOrderViewController ()

@property(nonatomic,strong) TheOrderHeadView * theOrderheadView;

@property(nonatomic,strong) TheOrderContentView *contrntView;

@property(nonatomic,strong) TheOrderBottomView *bottomView;

@property(nonatomic,strong) UIScrollView *scrollView;
@end

@implementation TheOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self addScrollview];
    
    [self addHeadView];
    
    [self addContentView];
    
    [self addBottomView];
}

- (void)addScrollview
{
    UIScrollView *scrVc = [[UIScrollView alloc] init];
    self.scrollView = scrVc;
    scrVc.bounces = NO;
    scrVc.frame = CGRectMake(0,169, ScreenWidth, ScreenHeight - 230);
    scrVc.backgroundColor = [UIColor orangeColor];
    self.scrollView.contentSize = CGSizeMake(0,ScreenHeight - 160 );
    
    [self.view addSubview:scrVc];
    
}


- (void)addHeadView
{
    
    _theOrderheadView = [[[NSBundle mainBundle] loadNibNamed:@"TheOrderHeadView" owner:nil options:nil] lastObject];
   
    _theOrderheadView.frame = CGRectMake(0, 64, ScreenWidth, 100);
    
    [self.view addSubview:_theOrderheadView];
    
    
}

- (void)addContentView
{
    _contrntView = [[[NSBundle mainBundle] loadNibNamed:@"TheOrderContentView" owner:nil options:nil] lastObject];
    _contrntView.frame = CGRectMake(0, - 64, ScreenWidth,570);
    
    [self.scrollView addSubview:_contrntView];
}

- (void)addBottomView
{
    _bottomView = [[[NSBundle mainBundle] loadNibNamed:@"TheOrderBottomView" owner:nil options:nil] lastObject];
    
    _bottomView.frame = CGRectMake(0, ScreenHeight - 50, ScreenWidth, 50);
    
    [self.view addSubview:_bottomView];
}

@end
