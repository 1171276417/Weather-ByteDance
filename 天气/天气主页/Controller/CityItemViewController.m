//
//  CityItemViewController.m
//  Weather
//
//  Created by 邓杰 on 2022/8/21.
//

#import "CityItemViewController.h"
#import "HomeViewController.h"
#import "HomeView.h"
#import "NetWorkingData.h"
#import "FutureOneDayTableViewCell.h"
#import "FutureSevenDayTableViewCell.h"
#import "Singleton.h"
#import "MapKit/MapKit.h"
#import "SelectLocationViewController.h"


@interface CityItemViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property(nonatomic, strong)HomeView *homeview;
@property(nonatomic, strong)NetWorkingData *netData;
@property(nonatomic, strong)GetListItem *RealTimeDictionary;//实时天气数据
@property(nonatomic, strong)NSMutableArray *FutureOneDayArray;//24小时天气数据
@property(nonatomic, strong)NSMutableArray *FutureSevenDayArray;//7天天气数据
@property(nonatomic, strong)GetListItem *AirQualityDictionaty;//空气质量数据
@property(nonatomic, strong)FutureOneDayTableViewCell *OneDayCell; //未来24小时预测cell
@property(nonatomic, strong)FutureSevenDayTableViewCell *SevenCell; //未来7天预测cell
@property(nonatomic, strong)Singleton *single;
@property(nonatomic, strong)NSString *LocationStr;//城市经纬度
@property(nonatomic, strong) WeatherView *weatherview;
@end

@implementation CityItemViewController

- (instancetype)init {
    self = [super init];
    if (self) {
//        _weatherview = [[WeatherView alloc] init];
//        [_weatherview setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        [_weatherview LoadWeatherView];
//        [self.view addSubview:_weatherview];
//
     
        
    };
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    _weatherview = [[WeatherView alloc] init];
    [_weatherview setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_weatherview LoadWeatherView];
    [self.view addSubview:_weatherview];
    
    //view中tableview的代理
    _weatherview.OneDaytableView.delegate = self;
    _weatherview.OneDaytableView.dataSource = self;
    _weatherview.SevenDayTemperaure.delegate = self;
    _weatherview.SevenDayTemperaure.dataSource = self;
    
    _weatherview.weatherScroller.delegate = self;
   
    //获得城市信息数据
    [self GetCityData];
    //请求天气数据
    [self LoadNetWorkingData];
    
    
    [_weatherview.btnLocation addTarget:self action:@selector(LoadLocationView) forControlEvents:UIControlEventTouchUpInside];
    [_weatherview.btnAdd addTarget:self action:@selector(AddLocation) forControlEvents:UIControlEventTouchUpInside];

    
    
}



///进入位置选择器
- (void)LoadLocationView{
    SelectLocationViewController *selectVC = [[SelectLocationViewController alloc] init];
    [self presentViewController:selectVC animated:YES completion:nil];
}

///添加该地方
- (void)AddLocation{
    _single = [Singleton sharedManager];
    [_single.AddCityListArray addObject:_LocationStr];
    [_single.AddCityNameArray addObject:_single.SeatchCityName];

    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backHome" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RefreshData1" object:nil];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

///设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    _single = [Singleton sharedManager];
    if(tableView == _weatherview.OneDaytableView){
        return 24;
    }
    if(tableView == _weatherview.SevenDayTemperaure){
        return 7;
    }
    else
        return 0;
}

///设置宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    _single = [Singleton sharedManager];

    if(tableView == _weatherview.OneDaytableView){
        return 50;
    }
    if(tableView == _weatherview.SevenDayTemperaure){
        return 50;
    }
    else
        return 0;
}

///设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    _single = [Singleton sharedManager];

    if(tableView == _weatherview.OneDaytableView){
        _OneDayCell = [[FutureOneDayTableViewCell alloc] init];
        GetListItem *item = [[GetListItem alloc] init];
        item = _FutureOneDayArray[indexPath.row];
        [_OneDayCell LoadFutureOneDayTableViewCell:item];
        _OneDayCell.contentView.transform = CGAffineTransformMakeRotation(M_PI/2);
        //使tableview无法点击
        _OneDayCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return _OneDayCell;
    }
    if(tableView == _weatherview.SevenDayTemperaure){
        _SevenCell = [[FutureSevenDayTableViewCell alloc] init];
        //使tableview无法点击
        _SevenCell.selectionStyle = UITableViewCellSelectionStyleNone;
        GetListItem *item = [[GetListItem alloc] init];
        item = _FutureSevenDayArray[indexPath.row];
        [_SevenCell LoadSevenDayTableViewCell:item];
        return _SevenCell;
    }
    else
        return [[UITableViewCell alloc] init];
    
    
}


///获取城市数据信息
- (void)GetCityData{
    _single = [Singleton sharedManager];
    
    if(_single.isInSearch){
        _LocationStr = _single.SearchLocation;
        self.weatherview.cityname.text = _single.SeatchCityName;
        _homeview.btnLocation.hidden = YES;
        _homeview.btnAdd.hidden = NO;
    }
    else{
        _homeview.btnLocation.hidden = NO;
        _homeview.btnAdd.hidden = YES;
        _LocationStr = _single.AddCityListArray[_single.page];
        self.weatherview.cityname.text = _single.AddCityNameArray[_single.page];

    }
    
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    _homeview = [[HomeView alloc] init];
//    NSLog(@"%f",_homeview.scrollviewPage.contentSize.width);
//}


///加载网络数据
- (void)LoadNetWorkingData{
    _single = [Singleton sharedManager];
    _netData = [[NetWorkingData alloc] init];
    //加载目前实时天气数据
    [_netData LoadRealTimeItemDataBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        self.RealTimeDictionary = dataArray[0];
        /**实时温度*/
        self->_weatherview.temperature.text = [self.RealTimeDictionary.now_temperature stringByAppendingString:@"°"];
        /**天气描述*/
        self->_weatherview.describe.text = self.RealTimeDictionary.now_describe;
        [self.weatherview setNeedsLayout];
    } AndLocation:_LocationStr];
    
    
    //加载24小时天气数据
    [_netData LoadFutureOneDayListItemBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        self.FutureOneDayArray = (NSMutableArray *)dataArray;
        GetListItem *item = self.FutureOneDayArray[0];
        self->_weatherview.rainFallView.RainFall.text = item.hourly_precip;
        self->_weatherview.rainFallView.Humidity.text = item.hourly_humidity;
        self->_weatherview.rainFallView.RainRate.text = item.hourly_pop;
        self->_weatherview.rainFallView.Dew.text = item.hourly_dew;
        self->_weatherview.rainFallView.CloudCover.text = item.hourly_cloud;
        [self.weatherview.OneDaytableView reloadData];
        [self.weatherview setNeedsLayout];

    } AndLocation:_LocationStr];
    
    //加载未来七天天气数据
    [_netData LoadFutureSevenDayListItemBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        self.FutureSevenDayArray = (NSMutableArray *)dataArray;
        /**当天最高最低温度*/
        GetListItem *item = [[GetListItem alloc] init];
        item = self.FutureSevenDayArray[0];
        self->_weatherview.temperaureMaxAndMin.text = [[[[@"最高" stringByAppendingString:item.daily_tempMax] stringByAppendingString:@"°  最低"] stringByAppendingString:item.daily_tempMin] stringByAppendingString:@"°"];
        [self->_weatherview.SevenDayTemperaure reloadData];
        [self.weatherview setNeedsLayout];
    } AndLocation:_LocationStr];
    
    //加载空气质量
    [_netData LoadAirQualityListItemBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        self.AirQualityDictionaty = dataArray[0];
        self->_weatherview.airQualityView.AirGrade.text = [[self.AirQualityDictionaty.now_aqi stringByAppendingString:@"-"] stringByAppendingString:self.AirQualityDictionaty.now_category];
        self->_weatherview.airQualityView.PM25.text = self.AirQualityDictionaty.now_pm2p5;
        self.weatherview.airQualityView.PM10.text = self.AirQualityDictionaty.now_pm10;
        self.weatherview.airQualityView.CO.text = self.AirQualityDictionaty.now_co;
        self.weatherview.airQualityView.NO2.text = self.AirQualityDictionaty.now_no2;
        self.weatherview.airQualityView.SO2.text = self.AirQualityDictionaty.now_so2;
        self.weatherview.airQualityView.O3.text = self.AirQualityDictionaty.now_o3;
        [self.weatherview setNeedsLayout];

    } AndLocation:_LocationStr];
    
}




@end
