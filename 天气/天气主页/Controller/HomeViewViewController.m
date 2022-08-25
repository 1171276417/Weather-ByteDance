//
//  HomeViewViewController.m
//  天气
//
//  Created by 邓杰 on 2022/8/25.
//

#import "HomeViewViewController.h"
#import "ChildViewController.h"
#import "HomeView.h"
#import "Singleton.h"
#import "WeatherView.h"
#import "SelectCityViewController.h"

@interface HomeViewViewController ()
@property(nonatomic, strong)HomeView *homeview;
@property(nonatomic, strong)Singleton *single;
@property(nonatomic, strong)WeatherView *weatherView;
@property(nonatomic, strong)NSString *LocationStr;//城市经纬度
@property(nonatomic, strong)SelectCityViewController *selectVC;
@property(nonatomic, strong)ChildViewController *childVC;//子控制器

@end

@implementation HomeViewViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _homeview = [[HomeView alloc] init];
        [_homeview setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TABBARHEIGHT)];
        [_homeview LoadHomeView];
        [self.view addSubview:_homeview];
    };
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //定位和添加按钮
    [_weatherView.btnLocation addTarget:self action:@selector(LoadLocationView) forControlEvents:UIControlEventTouchUpInside];
    [self LoadChildVC];
}


///加载子视图控制器
- (void)LoadChildVC{
    _single = [Singleton sharedManager];
    NSUInteger conut = _single.AddCityListArray.count;    //count为已经添加城市的数量，为天气的页数
    _homeview.scrollviewPage.contentSize = CGSizeMake(SCREEN_WIDTH*conut, SCREEN_HEIGHT);    //homeview的scrollview有count页
    
    for(int i=0; i<conut ; i++){
        _single.page = i;
        
        _childVC = [[ChildViewController alloc] init];
        [self addChildViewController:_childVC];
        [_childVC.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self.homeview.scrollviewPage addSubview:_childVC.view];
        [_childVC didMoveToParentViewController:self];
        [_homeview.scrollviewPage setNeedsLayout];

        
        
        
    }

   
}


///进入位置选择器
- (void)LoadLocationView{
    _selectVC = [[SelectCityViewController alloc] init];
    [self presentViewController:_selectVC animated:YES completion:nil];
}


@end
