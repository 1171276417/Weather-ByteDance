//
//  SelectLocationViewController.m
//  Weather
//
//  Created by 邓杰 on 2022/8/20.
//

#import "SelectLocationViewController.h"
#import "ScreenFrame.h"
#import "NetWorkingData.h"
#import "CoreLocation/CoreLocation.h"
#import "HomeViewController.h"
#import "Singleton.h"

@interface SelectLocationViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, CLLocationManagerDelegate>
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

@implementation SelectLocationViewController

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
    
    _netData = [[NetWorkingData alloc] init];
    [_netData LoadCityListItemBlock:^(NSArray * _Nonnull dataArray) {
        self->_cityNameListArray = dataArray.mutableCopy;
        NSLog(@"");
    }];
    

}

- (void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchBarCancelButtonClicked:) name:@"backHome" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"backHome" object:nil];
  
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [homeVC LoadChildVC];
    _single = [Singleton sharedManager];
    _single.isInSearch = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(RefreshData) name:@"RefreshData1" object:nil];
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"RefreshData" object:nil];
   

}

- (void)RefreshData{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"RefreshData1" object:nil];
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [homeVC LoadChildVC];
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
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadview"
                                                        object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
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

///设置宽度
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

               HomeViewController *homeVC = [[HomeViewController alloc] init];
               [self presentViewController:homeVC animated:YES completion:nil];
           }
       }];
    
    
}




@end
