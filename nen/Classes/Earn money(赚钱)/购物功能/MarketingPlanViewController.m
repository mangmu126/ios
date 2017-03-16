//
//  MarketingPlanViewController.m
//  nen
//
//  Created by nenios101 on 2017/3/6.
//  Copyright © 2017年 nen. All rights reserved.
//

#import "MarketingPlanViewController.h"
#import "PlanView.h"


@interface MarketingPlanViewController ()

@property(nonatomic,strong) PlanView *planView;

@end

@implementation MarketingPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    
   [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.000 green:0.800 blue:0.800 alpha:1.000]];
    

    
    [self addPlanView];
    
}
- (void)addPlanView
{
    _planView = [[[NSBundle mainBundle] loadNibNamed:@"PlanView" owner:nil options:nil] lastObject];
    
    _planView.frame = CGRectMake(0,99,ScreenWidth, ScreenHeight -99);
    
    [self.view addSubview:_planView];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
