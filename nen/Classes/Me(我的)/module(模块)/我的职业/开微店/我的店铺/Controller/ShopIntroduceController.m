//
//  ShopIntroduceController.m
//  nen
//
//  Created by nenios101 on 2017/3/10.
//  Copyright © 2017年 nen. All rights reserved.
//

#import "ShopIntroduceController.h"
#import "ShopIntroduceView.h"
@interface ShopIntroduceController ()

@end

@implementation ShopIntroduceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ShopIntroduceView *shopView = [[[NSBundle mainBundle] loadNibNamed:@"ShopIntroduceView" owner:nil options:nil] lastObject];
    
    shopView.frame = CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64);
    
    [self.view addSubview:shopView];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
