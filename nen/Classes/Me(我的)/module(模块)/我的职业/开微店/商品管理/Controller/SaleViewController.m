//
//  SaleViewController.m
//  nen
//
//  Created by nenios101 on 2017/3/9.
//  Copyright © 2017年 nen. All rights reserved.
//出售中


#import "SaleViewController.h"

@interface SaleViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation SaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
    [self addTableView];
    
}

- (void)addTableView
{
    UITableView *taVc = [[UITableView alloc] init];
    taVc.delegate = self;
    taVc.dataSource = self;
    taVc.frame = CGRectMake(0,0, ScreenWidth, ScreenHeight - 40);
    self.tableView = taVc;
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:taVc];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.确定重用标示:
    static NSString *ID = @"cell";
    
    // 2.从缓存池中取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 3.如果空就手动创建
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %zd", [self class], indexPath.row];
    
    return cell;
}

@end
