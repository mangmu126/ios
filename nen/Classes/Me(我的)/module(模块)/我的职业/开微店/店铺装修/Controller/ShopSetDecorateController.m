//
//  ShopSetDecorateController.m
//  nen
//
//  Created by nenios101 on 2017/3/10.
//  Copyright © 2017年 nen. All rights reserved.
//

#import "ShopSetDecorateController.h"
#import "ShopSetView.h"
@interface ShopSetDecorateController ()

@property(nonatomic,strong) UIScrollView *scrollview;

@end

@implementation ShopSetDecorateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addScrollView];
    
    [self addShopSetView];
}

- (void)addScrollView
{
    UIScrollView *scrVc = [[UIScrollView alloc] init];
    self.scrollview = scrVc;
    scrVc.bounces = NO;
    scrVc.backgroundColor = [UIColor redColor];
    scrVc.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
   
    [self.view addSubview:scrVc];
}

- (void)addShopSetView
{
    ShopSetView *setView = [[[NSBundle mainBundle] loadNibNamed:@"ShopSetView" owner:nil options:nil] lastObject];
    
    setView.frame = CGRectMake(0, 0, ScreenWidth,ScreenHeight - 20);
    
    [self.scrollview addSubview:setView];
    
     self.scrollview.contentSize = CGSizeMake(0,setView.sh_bottom);
}

@end
