//
//  SHPictureViewController.m
//  百思不得姐demo
//
//  Created by macbook pro on 16/10/15.
//  Copyright © 2016年 itcsas. All rights reserved.
//

#import "BuddhistCultureViewController.h"

@interface BuddhistCultureViewController ()

@end

@implementation BuddhistCultureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0,49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
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
