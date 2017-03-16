//
//  WarehouseViewController.m
//  nen
//
//  Created by nenios101 on 2017/3/9.
//  Copyright © 2017年 nen. All rights reserved.
//

#import "WarehouseViewController.h"



@interface WarehouseViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *backTableView;

@end

@implementation WarehouseViewController

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
    self.backTableView = taVc;
    self.backTableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 0, 0);
    self.backTableView.scrollIndicatorInsets = self.backTableView.contentInset;
    self.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:taVc];
    
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
