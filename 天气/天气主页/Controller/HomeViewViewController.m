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
#import "GetListItem.h"

@interface HomeViewViewController ()<UIScrollViewDelegate>
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
   // [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    _homeview = [[HomeView alloc] init];
    [_homeview setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TABBARHEIGHT)];
    [_homeview LoadHomeView];
    [self.view addSubview:_homeview];
    _homeview.scrollviewPage.delegate = self;
    _homeview.scrollviewPage.contentOffset = CGPointZero;
    
    NSString *path1 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"Name"];
    NSString *path2 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"Location"];
    NSString *path3 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"Data"];
    
    if([NSKeyedUnarchiver unarchiveObjectWithFile:path1]){
        NSMutableArray *item = [NSKeyedUnarchiver unarchiveObjectWithFile:path1];
        _single.AddCityNameArray = item;
        NSLog(@"");
    }
    if([NSKeyedUnarchiver unarchiveObjectWithFile:path2]){
        NSMutableArray *item = [NSKeyedUnarchiver unarchiveObjectWithFile:path2];
        _single.AddCityListArray = item;
        NSLog(@"");
    }
    if([NSKeyedUnarchiver unarchiveObjectWithFile:path3]){
        NSMutableArray *item = [NSKeyedUnarchiver unarchiveObjectWithFile:path3];
        _single.AddCityDataArray = item;
        NSLog(@"");
    }
    
    NSUInteger conut = _single.AddCityListArray.count;    //count为已经添加城市的数量，为天气的页数
    [_homeview.scrollviewPage setContentSize:CGSizeMake(SCREEN_WIDTH*conut, SCREEN_HEIGHT)];
    
    

    for(int i=0; i<conut ; i++){
        _single = [Singleton sharedManager];
        _single.page = i;
        
        _childVC = [[ChildViewController alloc] init];
        [self addChildViewController:_childVC];
        [_childVC.view setFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self.homeview.scrollviewPage addSubview:_childVC.view];
        [_childVC didMoveToParentViewController:self];
     
    }
   
}


///进入位置选择器
- (void)LoadLocationView{
    _selectVC = [[SelectCityViewController alloc] init];
    [self presentViewController:_selectVC animated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"");
}

@end
