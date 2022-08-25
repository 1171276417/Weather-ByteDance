//
//  ChildViewController.m
//  天气
//
//  Created by 邓杰 on 2022/8/26.
//

#import "ChildViewController.h"
#import "WeatherView.h"
#import "SelectCityViewController.h"
#import "Singleton.h"
#import "NetWorkingData.h"
#import "FutureOneDayTableViewCell.h"
#import "FutureSevenDayTableViewCell.h"

@interface ChildViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)WeatherView *weatherView; //天气界面View
@property(nonatomic, strong)Singleton *single; //单例类实例化
@property(nonatomic, strong)GetListItem *RealTimeDictionary;//实时天气数据
@property(nonatomic, strong)NSMutableArray *FutureOneDayArray;//24小时天气数据
@property(nonatomic, strong)NSMutableArray *FutureSevenDayArray;//7天天气数据
@property(nonatomic, strong)GetListItem *AirQualityDictionaty;//空气质量数据
@property(nonatomic, strong)FutureOneDayTableViewCell *OneDayCell; //未来24小时预测cell
@property(nonatomic, strong)FutureSevenDayTableViewCell *SevenCell; //未来7天预测cell
@property(nonatomic, strong)NSString *LocationStr;//城市经纬度
@property(nonatomic, strong)NetWorkingData *netData; //数据模型类实例化




@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _weatherView = [[WeatherView alloc] init];
    [_weatherView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_weatherView LoadWeatherView];
    [self.view addSubview:_weatherView];
    
    [self GetCityData];
    [self LoadNetWorkingData];
    
    _weatherView.OneDaytableView.delegate = self;
    _weatherView.OneDaytableView.dataSource = self;
    _weatherView.SevenDayTemperaure.delegate = self;
    _weatherView.SevenDayTemperaure.dataSource = self;
    
    [_weatherView.btnLocation addTarget:self action:@selector(LoadLocationView) forControlEvents:UIControlEventTouchUpInside];
    [_weatherView.btnAdd addTarget:self action:@selector(AddLocation) forControlEvents:UIControlEventTouchUpInside];

}

///进入位置选择器
- (void)LoadLocationView{
    SelectCityViewController *selectVC = [[SelectCityViewController alloc] init];
    [self presentViewController:selectVC animated:YES completion:nil];
}
///添加该地方
- (void)AddLocation{
    _single = [Singleton sharedManager];
    [_single.AddCityListArray addObject:_LocationStr];
    [_single.AddCityNameArray addObject:_single.SeatchCityName];

    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RefreshData1" object:nil];

}

///获取城市数据信息
- (void)GetCityData{
    _single = [Singleton sharedManager];
    if(_single.isInSearch){
        _LocationStr = _single.SearchLocation;
        self.weatherView.cityname.text = _single.SeatchCityName;
        _weatherView.btnLocation.hidden = YES;
        _weatherView.btnAdd.hidden = NO;
    }
    else{
        _weatherView.btnLocation.hidden = NO;
        _weatherView.btnAdd.hidden = YES;
        _LocationStr = _single.AddCityListArray[_single.page];
        self.weatherView.cityname.text = _single.AddCityNameArray[_single.page];
    }
}


///加载网络数据
- (void)LoadNetWorkingData{
    _single = [Singleton sharedManager];
    _netData = [[NetWorkingData alloc] init];
    //加载目前实时天气数据
    [_netData LoadRealTimeItemDataBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        self.RealTimeDictionary = dataArray[0];
        /**实时温度*/
        self->_weatherView.temperature.text = [self.RealTimeDictionary.now_temperature stringByAppendingString:@"°"];
        /**天气描述*/
        self->_weatherView.describe.text = self.RealTimeDictionary.now_describe;
        [self.weatherView setNeedsLayout];
    } AndLocation:_LocationStr];
    
    
    //加载24小时天气数据
    [_netData LoadFutureOneDayListItemBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        self.FutureOneDayArray = (NSMutableArray *)dataArray;
        GetListItem *item = self.FutureOneDayArray[0];
        self->_weatherView.rainFallView.RainFall.text = item.hourly_precip;
        self->_weatherView.rainFallView.Humidity.text = item.hourly_humidity;
        self->_weatherView.rainFallView.RainRate.text = item.hourly_pop;
        self->_weatherView.rainFallView.Dew.text = item.hourly_dew;
        self->_weatherView.rainFallView.CloudCover.text = item.hourly_cloud;
        [self.weatherView.OneDaytableView reloadData];
        [self.weatherView setNeedsLayout];

    } AndLocation:_LocationStr];
    
    //加载未来七天天气数据
    [_netData LoadFutureSevenDayListItemBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        self.FutureSevenDayArray = (NSMutableArray *)dataArray;
        /**当天最高最低温度*/
        GetListItem *item = [[GetListItem alloc] init];
        item = self.FutureSevenDayArray[0];
        self->_weatherView.temperaureMaxAndMin.text = [[[[@"最高" stringByAppendingString:item.daily_tempMax] stringByAppendingString:@"°  最低"] stringByAppendingString:item.daily_tempMin] stringByAppendingString:@"°"];
        [self->_weatherView.SevenDayTemperaure reloadData];
        [self.weatherView setNeedsLayout];
    } AndLocation:_LocationStr];
    
    //加载空气质量
    [_netData LoadAirQualityListItemBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        self.AirQualityDictionaty = dataArray[0];
        self->_weatherView.airQualityView.AirGrade.text = [[self.AirQualityDictionaty.now_aqi stringByAppendingString:@"-"] stringByAppendingString:self.AirQualityDictionaty.now_category];
        self->_weatherView.airQualityView.PM25.text = self.AirQualityDictionaty.now_pm2p5;
        self.weatherView.airQualityView.PM10.text = self.AirQualityDictionaty.now_pm10;
        self.weatherView.airQualityView.CO.text = self.AirQualityDictionaty.now_co;
        self.weatherView.airQualityView.NO2.text = self.AirQualityDictionaty.now_no2;
        self.weatherView.airQualityView.SO2.text = self.AirQualityDictionaty.now_so2;
        self.weatherView.airQualityView.O3.text = self.AirQualityDictionaty.now_o3;
        [self.weatherView setNeedsLayout];

    } AndLocation:_LocationStr];
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

///设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    _single = [Singleton sharedManager];
    if(tableView == _weatherView.OneDaytableView){
        return 24;
    }
    if(tableView == _weatherView.SevenDayTemperaure){
        return 7;
    }
    else
        return 0;
}

///设置宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    _single = [Singleton sharedManager];

    if(tableView == _weatherView.OneDaytableView){
        return 50;
    }
    if(tableView == _weatherView.SevenDayTemperaure){
        return 50;
    }
    else
        return 0;
}

///设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    _single = [Singleton sharedManager];

    if(tableView == _weatherView.OneDaytableView){
        _OneDayCell = [[FutureOneDayTableViewCell alloc] init];
        GetListItem *item = [[GetListItem alloc] init];
        item = _FutureOneDayArray[indexPath.row];
        [_OneDayCell LoadFutureOneDayTableViewCell:item];
        _OneDayCell.contentView.transform = CGAffineTransformMakeRotation(M_PI/2);
        //使tableview无法点击
        _OneDayCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return _OneDayCell;
    }
    if(tableView == _weatherView.SevenDayTemperaure){
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



@end
