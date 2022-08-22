//
//  HomeViewController.m
//  Weather
//
//  Created by 邓杰 on 2022/7/25.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "NetWorkingData.h"
#import "FutureOneDayTableViewCell.h"
#import "FutureSevenDayTableViewCell.h"
#import "Singleton.h"
#import "MapKit/MapKit.h"
#import "SelectLocationViewController.h"
#import "CityItemViewController.h"


@interface HomeViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property(nonatomic, strong)HomeView *homeview;
@property(nonatomic, strong)NetWorkingData *netData;
@property(nonatomic, strong)GetListItem *RealTimeDictionary;//实时天气数据
@property(nonatomic, strong)NSMutableArray *FutureOneDayArray;//24小时天气数据
@property(nonatomic, strong)NSMutableArray *FutureSevenDayArray;//7天天气数据
@property(nonatomic, strong)GetListItem *AirQualityDictionaty;//空气质量数据
@property(nonatomic, strong)FutureOneDayTableViewCell *OneDayCell; //未来24小时预测cell
@property(nonatomic, strong)FutureSevenDayTableViewCell *SevenCell; //未来7天预测cell
@property(nonatomic, strong)Singleton *single;
@property(nonatomic, strong)NSMutableString *LocationStr;//城市经纬度
@property(nonatomic, strong) WeatherView *weatherview;
@property(nonatomic, strong)CityItemViewController *CityVC;

@end

@implementation HomeViewController


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
  
//    _homeview = [[HomeView alloc] init];
//    [_homeview setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TABBARHEIGHT)];
//    [_homeview LoadHomeView];
//    [self.view addSubview:_homeview];
    _homeview.scrollviewPage.delegate = self;
    [self LoadChildVC];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LoadChildVC) name:@"RefreshData" object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


///加载子视图控制器
- (void)LoadChildVC{

    _single = [Singleton sharedManager];
    if(_single.isInSearch){
        [[_homeview.scrollviewPage subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
        _LocationStr = _single.SearchLocation;

    }
    //清空homeview的子视图，重新加载
    [[_homeview.scrollviewPage subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //count为已经添加城市的数量，为天气的页数
    NSUInteger conut = _single.AddCityListArray.count;
    //homeview的scrollview有count页
   // _homeview.scrollviewPage.contentSize = CGSizeMake(SCREEN_WIDTH * conut, SCREEN_HEIGHT);
    [_homeview.scrollviewPage setContentSize:CGSizeMake(SCREEN_WIDTH * 2, SCREEN_HEIGHT)];
    NSLog(@"%f",_homeview.scrollviewPage.contentSize.width);
    //遍历每一页添加同一个View
    for(int i=0; i<2; i++){
        if(conut == 2){
            _single.page = i;
            _LocationStr = _single.AddCityListArray[i];
            NSLog(@"%f",_homeview.scrollviewPage.contentSize.width);

        }
        else{
            _single.page = 0;
            //当前城市的经纬度
            _LocationStr = _single.AddCityListArray[0];
        }
//        _single.page = 0;
//        //当前城市的经纬度
//        _LocationStr = _single.AddCityListArray[0];
        //新建view添加到scrollview中
        _CityVC = [[CityItemViewController alloc] init];
        [self addChildViewController:_CityVC];
        [_CityVC.view setFrame:CGRectMake(SCREEN_WIDTH *i , 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [_homeview.scrollviewPage addSubview:_CityVC.view];
        
        [_CityVC didMoveToParentViewController:self];
        [_homeview setNeedsLayout];
        NSLog(@"%f",_homeview.scrollviewPage.contentSize.width);

    }

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",_homeview.scrollviewPage.contentSize.width);
}



@end
