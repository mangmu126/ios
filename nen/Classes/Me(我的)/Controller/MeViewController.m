//
//  MeViewController.m
//  nen
//
//  Created by nenios101 on 2017/2/27.
//
//我的

#import "MeViewController.h"
#import "MeHeadView.h"
#import "MyCareerView.h"
#import "MyShoppView.h"
#import "AppointmentView.h"
#import "ProfessionalView.h"
#import "PlatformView.h"
#import "SmallShopViewController.h"
#import "MyProfessionalController.h"
#import "DoConsultantController.h"
#import "DoTeacherController.h"
#import "DoMasterController.h"
@interface MeViewController ()

@property(nonatomic,strong)MeHeadView *meHeadView;

@property(nonatomic,weak) UIScrollView  *scrollView;

@property(nonatomic,strong)MyCareerView *careerView;

@property(nonatomic,strong)MyShoppView *shoppView;

@property(nonatomic,strong)AppointmentView *appointView;

@property(nonatomic,strong)ProfessionalView *professView;

@property(nonatomic,strong)PlatformView *platformView;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self establishScrollView];
    
    [self setNav];
    
    [self addHeadView];
    
    [self addCareerView];
    
    [self addshoppingView];
    
    [self addAppointmentView];
    
    [self addProfessionalView];
    
    [self addplatforView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(smallBtn:) name:@"weidian" object:nil];
    
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(professBtn) name:@"profess" object:nil];
    
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(consultantBtn) name:@"consultant" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doConsultantBtn) name:@"doConsultant" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doTeacherBtn) name:@"doTeacher" object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doMasterBtn) name:@"doMaster" object:nil];
    
   
}

#pragma mark 微店
- (void)smallBtn:(NSNotification*)notification
{
    [self.navigationController pushViewController:[[SmallShopViewController alloc] init] animated:YES];
}
#pragma mark 做顾问
- (void)consultantBtn
{
    [self.navigationController pushViewController:[[DoConsultantController alloc] init] animated:YES];
}

#pragma mark 我的职业
- (void)professBtn
{
    [self.navigationController pushViewController:[[MyProfessionalController alloc] init] animated:YES];
}

#pragma mark 当顾问
- (void)doConsultantBtn
{
     [self.navigationController pushViewController:[[DoConsultantController alloc] init] animated:YES];
}

#pragma mark 当老师
- (void)doTeacherBtn
{
    [self.navigationController pushViewController:[[DoTeacherController alloc] init] animated:YES];
}

#pragma mark 当师傅
- (void)doMasterBtn
{
    [self.navigationController pushViewController:[[DoMasterController alloc] init] animated:YES];
}




- (void)establishScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    scrollView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.contentSize = CGSizeMake(0,_platformView.sh_bottom);
    
    
    
    [self.view addSubview:scrollView];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.scrollView.contentSize = CGSizeMake(0, _platformView.sh_bottom);
     self.navigationController.navigationBarHidden = YES;
}

- (void)setNav
{
    self.view.backgroundColor = [UIColor whiteColor];
   
}


// 头部

- (void)addHeadView
{
     _meHeadView = [[[NSBundle mainBundle] loadNibNamed:@"MeHeadView" owner:nil options:nil] lastObject];
    
    _meHeadView.sh_width = ScreenWidth;
    _meHeadView.sh_height = 120;
    _meHeadView.sh_x = 0;
    _meHeadView.sh_y = 0;
    [self.scrollView addSubview:_meHeadView];
    
}
// 我的事业

- (void)addCareerView
{
    
    _careerView = [[[NSBundle mainBundle] loadNibNamed:@"MyCareerView" owner:nil options:nil] lastObject];
    _careerView.sh_width = ScreenWidth;
    _careerView.sh_height = 90;
    _careerView.sh_x = 0;
    _careerView.sh_y = _meHeadView.sh_bottom;
    [self.scrollView addSubview:_careerView];
}

// 我的购物单

- (void)addshoppingView
{
    _shoppView = [[[NSBundle mainBundle] loadNibNamed:@"MyShoppView" owner:nil options:nil] lastObject];
    _shoppView.sh_width = ScreenWidth;
    _shoppView.sh_height = 90;
    _shoppView.sh_x = 0;
    _shoppView.sh_y = _careerView.sh_bottom + 10;
    [self.scrollView addSubview:_shoppView];
}

//  我的预约单

- (void)addAppointmentView
{
    _appointView = [[[NSBundle mainBundle] loadNibNamed:@"AppointmentView" owner:nil options:nil] lastObject];
    _appointView.sh_width = ScreenWidth;
    _appointView.sh_height = 90;
    _appointView.sh_x = 0;
    _appointView.sh_y = _shoppView.sh_bottom + 10;
    [self.scrollView addSubview:_appointView];
}
//  我的职业
-(void)addProfessionalView
{
    _professView = [[[NSBundle mainBundle] loadNibNamed:@"ProfessionalView" owner:nil options:nil] firstObject];
    _professView.sh_width = ScreenWidth;
    _professView.sh_height = 170;
    _professView.sh_x = 0;
    _professView.sh_y = _appointView.sh_bottom + 10;
    [self.scrollView addSubview:_professView];
    
}
//  联盟平台
- (void)addplatforView
{
    _platformView = [[[NSBundle mainBundle] loadNibNamed:@"PlatformView" owner:nil options:nil] lastObject];
    _platformView.sh_width = ScreenWidth;
    _platformView.sh_height = 220;
    _platformView.sh_x = 0;
    _platformView.sh_y = _professView.sh_bottom + 20;
    [self.scrollView addSubview:_platformView];

}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
