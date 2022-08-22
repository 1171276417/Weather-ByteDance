//
//  SceneDelegate.m
//  Weather
//
//  Created by 邓杰 on 2022/7/25.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()<CLLocationManagerDelegate>
@property(nonatomic,strong)CLLocationManager *locMgr;
@property(nonatomic, strong)Singleton *single;
@property(nonatomic, strong)UITabBarController *tabbarcontroller;
@property(nonatomic, strong)HomeViewController *homeVC;
@property(nonatomic, strong)LivingViewController *LivingVC;
@property(nonatomic, strong)MeViewController *meVC;

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    //获取定位
    self.locMgr=[[CLLocationManager alloc]init];
    self.locMgr.delegate=self;
    if ([self checkLocationServiceIsEnabled]) {
            [self createCLManager];
        }
    
    
    UIWindowScene *windowscene=(UIWindowScene*)scene;
    self.window=[[UIWindow alloc] initWithWindowScene:windowscene];
    self.window.frame=windowscene.coordinateSpace.bounds;

    
    _tabbarcontroller=[[UITabBarController alloc] init];
 
}


- (BOOL)checkLocationServiceIsEnabled{
    // 该方法是类方法，和我们创建的管理器没有关系
    if ([CLLocationManager locationServicesEnabled]) {
        return YES;
    }
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"系统定位尚未打开，请到【设定-隐私】中手动打开" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * tipsAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:tipsAction];
//    [self presentViewController:alertVC animated:YES completion:nil];
    
    return NO;
}

- (void)createCLManager{
    // 创建CoreLocation管理对象
    self.locMgr = [[CLLocationManager alloc]init];
    // 设定定位精准度
    [self.locMgr setDesiredAccuracy:kCLLocationAccuracyBest];
    // 设定DistanceFilter可以在用户移动指定距离之后触发更新事件（100米更新一次）
    [self.locMgr setDistanceFilter:100.f];
    // 设置代理
    self.locMgr.delegate = self;
    // 开始更新定位
    [self.locMgr startUpdatingLocation];
}


// 代理方法，定位权限检查
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:{
            NSLog(@"用户还未决定授权");
            // 主动获得授权
            [self.locMgr requestWhenInUseAuthorization];
            break;
        }
        case kCLAuthorizationStatusRestricted:
        {
            NSLog(@"访问受限");
            // 主动获得授权
            [self.locMgr requestWhenInUseAuthorization];
            break;
        }
        case kCLAuthorizationStatusDenied:{
            // 此时使用主动获取方法也不能申请定位权限
            // 类方法，判断是否开启定位服务
            if ([CLLocationManager locationServicesEnabled]) {
                NSLog(@"定位服务开启，被拒绝");
            } else {
                NSLog(@"定位服务关闭，不可用");
            }
            break;
        }
        case kCLAuthorizationStatusAuthorizedAlways:{
            NSLog(@"获得前后台授权");
            break;
        }
        case kCLAuthorizationStatusAuthorizedWhenInUse:{
            NSLog(@"获得前台授权");
            break;
        }
        default:
            break;
    }
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *locat = [locations lastObject];
    _single = [Singleton sharedManager];

    [self.locMgr stopUpdatingLocation];
    
    //获取定位经纬度
    CLLocationCoordinate2D coor2D = locat.coordinate;


    NSLog(@"纬度为:%.2f, 经度为:%.2f", coor2D.latitude, coor2D.longitude);
    NSString *Strlatitude =[NSString stringWithFormat:@"%.2f", coor2D.latitude];
    NSString *Strlongitude =[NSString stringWithFormat:@"%.2f", coor2D.longitude];
    NSString *LocationStr = [[Strlongitude stringByAppendingString:@","] stringByAppendingString:Strlatitude];

         
    //获取城市名街道数据
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:locat completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            CLPlacemark *placeMark = placemarks[0];
            NSLog(@"位置:%@", placeMark.name);
            NSLog(@"街道:%@", placeMark.thoroughfare);
            NSLog(@"子街道:%@", placeMark.subThoroughfare);
            NSLog(@"市:%@", placeMark.locality);
            NSLog(@"区\\县:%@", placeMark.subLocality);
            NSLog(@"行政区:%@", placeMark.administrativeArea);
            NSLog(@"国家:%@", placeMark.country);
        
        self->_single.AddCityNameArray = @[].mutableCopy;
        [self->_single.AddCityNameArray addObject:placeMark.subLocality];
        
        _single.SelfLocation = locat;
        _single.AddCityListArray = @[].mutableCopy;
        [_single.AddCityListArray addObject:LocationStr];
        
        //创建三个子控制器
        _homeVC=[[HomeViewController alloc] init];
        _LivingVC=[[LivingViewController alloc] init];
        _meVC=[[MeViewController alloc] init];
        
        //底部标题设置标题
        _homeVC.tabBarItem.title=@"天气";
        _LivingVC.tabBarItem.title=@"生活";
        _meVC.tabBarItem.title=@"我";

        //设置背景颜色
        _homeVC.view.backgroundColor=[UIColor whiteColor];
        _LivingVC.view.backgroundColor=[UIColor whiteColor];
        _meVC.view.backgroundColor=[UIColor whiteColor];
        
        //设置图标
        _homeVC.tabBarItem.image=[UIImage imageNamed:@"2"];
        _LivingVC.tabBarItem.image=[UIImage imageNamed:@"2"];
        _meVC.tabBarItem.image=[UIImage imageNamed:@"3"];
        
        [_tabbarcontroller setViewControllers:@[_homeVC,_LivingVC,_meVC]];
        _window.rootViewController=_tabbarcontroller;
        
        [self.window makeKeyAndVisible];
        
        
    }];
    
         
    
   

    
}



- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
