//
//  TrainingEducationViewController.m
//  nen
//
//  Created by nenios101 on 2017/3/8.
//  Copyright © 2017年 nen. All rights reserved.
//培训圈

#import "TrainingEducationViewController.h"
#import "EducationOptionModel.h"
#import "EducationOptionsView.h"
#import "EducationCell.h"
#import "DrivingSchoolViewController.h"
@interface TrainingEducationViewController ()

// 模型数组
@property (nonatomic, strong) NSArray *educationList;

@property(nonatomic,strong) UIButton *btn;

// 选项区
@property(nonatomic,strong) UIView *opctionview;

@property(nonatomic,strong) UILabel *locationName;

@end

@implementation TrainingEducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.tableView.tableHeaderView = [self addHeadView];
    self.tableView.rowHeight = 150;
    self.tableView.bounces = NO;
    
    
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
}

#pragma mark 模拟数据数组
- (NSArray *)educationList
{
    if (_educationList == nil) {
        NSMutableArray *mutArray = [NSMutableArray array];
        NSArray * array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"educationoption.plist" ofType:nil]];
        for (NSDictionary *dict in array) {
            [mutArray addObject:[EducationOptionModel modelWithDict:dict]];
        }
        _educationList = mutArray;
    }
    
    return _educationList;
}


- (UIView *)addHeadView
{
    UIView *headView = [[UIView alloc] init];
    
    UISearchBar *searBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 5,ScreenWidth * 0.9,30)];
    searBar.placeholder = @"找驾校 找家教 找教练 找家教";
    searBar.showsCancelButton = NO;
    searBar.searchBarStyle = UISearchBarStyleMinimal;
    [headView addSubview:searBar];
    
    NSArray *familyArray = @[@"1",@"2",@"3"];
    
    //控制总列数
    int totalColumns = 3;
    // CGFloat Y = 5 ;
    CGFloat W = 100;
    CGFloat H = 70;
    CGFloat X = (self.view.frame.size.width - totalColumns * W) / (totalColumns + 1);
    
    for (int index = 0; index <familyArray.count ; index++) {
        
        // int row = index / totalColumns;
        int col = index % totalColumns;
        CGFloat viewX = X + col * (W + X);
         // CGFloat viewY = 20 + row * (H + Y);
        
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setImage:[UIImage imageNamed:familyArray[index]] forState:UIControlStateNormal];
        _btn.titleLabel.text = @"考驾照";
        _btn.titleLabel.textColor = [UIColor blackColor];
        _btn.tag = index+1;
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _btn.frame = CGRectMake(viewX, searBar.sh_bottom + 5, W, H);
        
        [headView addSubview:_btn];
        
    }
    
    // 选项区
    self.opctionview = [[UIView alloc] initWithFrame:CGRectMake(0,_btn.sh_bottom + 5, ScreenWidth, 180)];
    [self educationList];
    //控制总列数
    int optionTotalColumn = 5;
    CGFloat optionY = 10;
    CGFloat optionW = 60;
    CGFloat optionH = 75;
    CGFloat optionX = (ScreenWidth - optionTotalColumn * optionW) / (optionTotalColumn + 1);
    for (int index = 0; index < _educationList.count; index++) {
        
        EducationOptionModel *model = _educationList[index];
        int row = index / optionTotalColumn;
        int col = index % optionTotalColumn;
        CGFloat viewX = optionX + col * (optionW + optionX);
        CGFloat viewY = 15 + row * (optionH + optionY);
       EducationOptionsView *view = [[EducationOptionsView alloc]initWithFrame:CGRectMake(viewX, viewY, optionW, optionH) Model:model Index:index];
        view.backgroundColor =[UIColor greenColor];
        
        [self.opctionview addSubview:view];
        
        
    }
    self.opctionview.backgroundColor = [UIColor redColor];

    [headView addSubview:self.opctionview];
    // 分割线
    UIView *segmentationLine = [[UIView alloc] init];
    segmentationLine.frame = CGRectMake(0,self.opctionview.sh_bottom,ScreenWidth,8);
    segmentationLine.backgroundColor = [UIColor lightGrayColor];
    [headView addSubview:segmentationLine];
    
    // 位置
    _locationName = [[UILabel alloc]init];
    _locationName.text = @"当前位置: 广东省广州市萝岗区创新路";
    _locationName.frame = CGRectMake(10, segmentationLine.sh_bottom,ScreenWidth *0.8,30);
    [headView addSubview:_locationName];
    
  
    // 底部分割线
    UIView *segmentationBottomLine = [[UIView alloc] init];
    segmentationBottomLine.frame = CGRectMake(0,_locationName.sh_bottom,ScreenWidth,5);
    segmentationBottomLine.backgroundColor = [UIColor lightGrayColor];
    [headView addSubview:segmentationBottomLine];

    headView.frame = CGRectMake(0, 0,ScreenWidth,segmentationBottomLine.sh_bottom);
    headView.backgroundColor = [UIColor whiteColor];
    
    return headView;
}


#pragma mark 按钮方法

- (void)btnClick:(UIButton *)btn
{
    switch (btn.tag) {
        case 1:
            // 考驾照
            [self.navigationController pushViewController:[[DrivingSchoolViewController alloc] init] animated:YES];
            break;
        case 2:
            // 中小学生辅导
            break;
        case 3:
            // 兴趣班
            
            break;
        default:
            break;
    }
    
}

#pragma mark tableViewSoure 方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    static NSString *ID = @"cell";
    
 
    EducationCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
   
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"EducationCell" owner:nil options:nil]lastObject];
    }
    
    return cell;
}


@end
