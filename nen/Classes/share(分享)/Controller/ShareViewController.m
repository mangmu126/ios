//
//  ShareViewController.m
//  nen
//
//  Created by nenios101 on 2017/3/1.
//  Copyright © 2017年 nen. All rights reserved.
//

#import "ShareViewController.h"
#import "JZLCycleView.h"
#import "PostShare.h"
#import "MyLinkView.h"
#import "MyTwoDimensionalCode.h"

@interface ShareViewController ()
// 图片轮播器
@property (nonatomic, weak) JZLCycleView *headPictureCarouselView;
// 我的瞬间分享
@property(nonatomic,strong) PostShare *postShareView;
// 我的链接
@property(nonatomic,strong) MyLinkView *linkView;

@property(nonatomic,strong) MyTwoDimensionalCode *twoDimesnsionalView;

@property(nonatomic,weak) UIScrollView *scrollV;
@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollV = [[UIScrollView alloc] init];
    self.scrollV = scrollV;
    scrollV.frame = CGRectMake(0,-64,ScreenWidth,ScreenHeight + 20);
    scrollV.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:scrollV];
    
    
    [self pictureCarousel];

    [self sharePost];
    
    [self MyLink];
    
    [self MyTwoDimensionalCodeView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.scrollV.contentSize = CGSizeMake(0, _twoDimesnsionalView.sh_bottom - 64);
}



- (void)pictureCarousel
{
    // 图片轮播器
    NSMutableArray *arrTemp = [NSMutableArray array];
    for (NSInteger i = 1; i < 5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%ld",@"car",(long)i]];
        [arrTemp addObject:image];
    }
    _headPictureCarouselView = [JZLCycleView cycleCollectionViewWithFrame:CGRectMake(0,64, ScreenWidth,150) imageArray:arrTemp PlaceholderImage:[UIImage imageNamed:@"placeholderImage"]];
    [self.scrollV addSubview:_headPictureCarouselView];

}

- (void)sharePost
{
    self.postShareView = [[[NSBundle mainBundle] loadNibNamed:@"PostShare" owner:nil options:nil] lastObject];
    self.postShareView.sh_width = ScreenWidth;
    self.postShareView.sh_height = 230;
    self.postShareView.sh_y = self.headPictureCarouselView.sh_bottom;
    self.postShareView.sh_x = 0;
    self.postShareView.backgroundColor = [UIColor redColor];
    [self.scrollV addSubview:self.postShareView];
    
}

- (void)MyLink
{
     _linkView = [[[NSBundle mainBundle] loadNibNamed:@"MyLinkView" owner:nil options:nil] lastObject];
    _linkView.sh_x = 0;
    _linkView.sh_y = self.postShareView.sh_bottom + 5;
    _linkView.sh_width = ScreenWidth;
    _linkView.sh_height = 80;
    
    [self.scrollV addSubview:_linkView];
}

- (void)MyTwoDimensionalCodeView
{
   _twoDimesnsionalView = [[[NSBundle mainBundle] loadNibNamed:@"MyTwoDimensionalCode" owner:nil options:nil] lastObject];
    _twoDimesnsionalView.sh_x = 0;
    _twoDimesnsionalView.sh_y = _linkView.sh_bottom + 5;
    _twoDimesnsionalView.sh_width = ScreenWidth;
    _twoDimesnsionalView.sh_height = 85;
    
    [self.scrollV addSubview:_twoDimesnsionalView];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
