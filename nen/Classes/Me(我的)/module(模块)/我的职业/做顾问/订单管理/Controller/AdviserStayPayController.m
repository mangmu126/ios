//
//  AdviserStayPayController.m
//  nen
//
//  Created by nenios101 on 2017/3/14.
//  Copyright © 2017年 nen. All rights reserved.
//待付款

#import "AdviserStayPayController.h"
#import "AdviserStayPayCell.h"
@interface AdviserStayPayController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation AdviserStayPayController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableView];
    
}

- (void)addTableView
{
     UITableView *tableView = [[UITableView alloc] init];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 150;
    tableView.bounces = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.frame = CGRectMake(0,64 + 39,ScreenWidth,ScreenHeight);
    
    UIView *colorView = [[UIView alloc] init];
    colorView.backgroundColor = [UIColor orangeColor];
    tableView.backgroundView = colorView;
    
    [self.view addSubview:tableView];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * ID = @"cell";
    
    AdviserStayPayCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AdviserStayPayCell" owner:nil options:nil] lastObject];
    }
    
    return  cell;
    
}

@end
