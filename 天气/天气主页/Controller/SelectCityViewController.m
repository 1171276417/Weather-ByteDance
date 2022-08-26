//
//  SelectCityViewController.m
//  天气
//
//  Created by 邓杰 on 2022/8/25.
//

#import "SelectCityViewController.h"
#import "ScreenFrame.h"
#import "NetWorkingData.h"
#import "CoreLocation/CoreLocation.h"
#import "Singleton.h"
#import "SearchCityDataViewController.h"
#import "HomeViewViewController.h"


@interface SelectCityViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, CLLocationManagerDelegate>
@property(nonatomic, strong)UITableView *tableview;
@property(nonatomic, strong)UISearchBar *searchBar;
@property(nonatomic, strong)UITextField *searchtext;
@property(nonatomic, strong)UIButton *btnsearch;
@property(nonatomic, strong)NetWorkingData *netData;
@property(nonatomic, strong)NSMutableArray *cityNameListArray;
@property(nonatomic, strong)NSMutableArray *searchResultCity;
@property(nonatomic, strong)CLLocationManager *locationManager;
@property(nonatomic, strong)Singleton *single;

@end

@implementation SelectCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(29,0,SCREEN_WIDTH - 30,60)];
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.delegate =self;
    _searchBar.frame =CGRectMake(0,0,CGRectGetWidth(titleView.frame),60);
    _searchBar.layer.cornerRadius =18;
    _searchBar.layer.masksToBounds =YES;
    _searchBar.showsCancelButton = YES;
    _searchBar.showsSearchResultsButton = YES;

    _searchBar.placeholder = @"搜索";
    [self.view addSubview:_searchBar];
    
    _tableview = [[UITableView alloc] init];
    [_tableview setFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_tableview];

    _tableview.delegate = self;
    _tableview.dataSource = self;
    
    //获取全世界城市列表
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"CityList"];

    if([NSKeyedUnarchiver unarchiveObjectWithFile:path]){
        NSMutableArray *item = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        self.cityNameListArray = item;
    }
    else{
        _netData = [[NetWorkingData alloc] init];
        [_netData LoadCityListItemBlock:^(NSArray * _Nonnull dataArray) {
            self.cityNameListArray = dataArray.mutableCopy;
            [NSKeyedArchiver archiveRootObject: self.cityNameListArray toFile:path];
        }];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    HomeViewViewController *homeVC = [[HomeViewViewController alloc] init];
    [homeVC LoadChildVC];
    _single = [Singleton sharedManager];
    _single.isInSearch = NO;
}


///当输入内容改变
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if(text){
        searchBar.placeholder = nil;
        
        _searchResultCity = @[].mutableCopy;
        for(NSString *cityname in _cityNameListArray){
            if([cityname containsString:text]){
                [_searchResultCity addObject:cityname];
            }
        }
        [_tableview reloadData];
    }
    if([text  isEqual: @""]){
        searchBar.placeholder = @"搜索";
        [_tableview reloadData];
    }
    return YES;
}

///点击取消
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self dismissViewControllerAnimated:YES completion:nil];
}
///搜索
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:searchBar.text completionHandler:^(NSArray *placemarks, NSError *error){
           NSLog(@"查询记录数:%ld",[placemarks count]);
           if ([placemarks count] > 0) {
               CLPlacemark *placemark = [placemarks objectAtIndex:0];
               CLLocationCoordinate2D coordinatee = placemark.location.coordinate;
               
               NSString *strCoordinate = [[[NSString stringWithFormat:@"%.2f",coordinatee.longitude] stringByAppendingString:@","] stringByAppendingString:[NSString stringWithFormat:@"%.2f",coordinatee.latitude]];
               NSLog(@"");
               self->_single = [Singleton sharedManager];
               self->_single.SearchLocation = strCoordinate;
               self.single.isInSearch = YES;
               self->_single.SeatchCityName = searchBar.text;

               SearchCityDataViewController *searchVC = [[SearchCityDataViewController alloc] init];
               [self presentViewController:searchVC animated:YES completion:nil];
           }
       }];

}


///设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(_searchResultCity){
        return _searchResultCity.count;
    }
    else{
        return 0;
    }
}

//设置宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}


///内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    cell.textLabel.text= _searchResultCity[indexPath.row];
    return cell;
}


//点击进入tableview
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:_searchResultCity[indexPath.row] completionHandler:^(NSArray *placemarks, NSError *error){
           NSLog(@"查询记录数:%ld",[placemarks count]);
           if ([placemarks count] > 0) {
               CLPlacemark *placemark = [placemarks objectAtIndex:0];
               CLLocationCoordinate2D coordinatee = placemark.location.coordinate;
               
               NSString *strCoordinate = [[[NSString stringWithFormat:@"%.2f",coordinatee.longitude] stringByAppendingString:@","] stringByAppendingString:[NSString stringWithFormat:@"%.2f",coordinatee.latitude]];
               NSLog(@"");
               self->_single = [Singleton sharedManager];
               self->_single.SearchLocation = strCoordinate;
               self.single.isInSearch = YES;
               self->_single.SeatchCityName = self->_searchResultCity[indexPath.row];

               SearchCityDataViewController *searchVC = [[SearchCityDataViewController alloc] init];
               [self presentViewController:searchVC animated:YES completion:nil];
           }
       }];
    
    
}

@end
