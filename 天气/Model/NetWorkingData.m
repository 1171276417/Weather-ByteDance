//
//  NetWorkingData.m
//  Weather
//
//  Created by 邓杰 on 2022/8/12.
//

#import "NetWorkingData.h"

@implementation NetWorkingData

//实时天气数据
- (void)LoadRealTimeItemDataBlock:(RealTimeListItemLoadBlock)finishBlock AndLocation:(nonnull NSString *)Location{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"key":@"da76b6a4c7b54f7190968de611731375",
        @"location":Location
    };
    [manager GET:@"https://devapi.qweather.com/v7/weather/now?" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemArray = @[].mutableCopy;
        GetListItem *list = [[GetListItem alloc] init];
        [list RealTimeModelListItemData:[((NSDictionary *)responseObject)objectForKey:@"now"]];
        [listItemArray addObject:list];
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }]; 
}


//未来24小时天气数据
- (void)LoadFutureOneDayListItemBlock:(FutureOneDayListItemLoadBlock)finishBlock AndLocation:(nonnull NSString *)Location{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"key":@"da76b6a4c7b54f7190968de611731375",
        @"location":Location
    };
    [manager GET:@"https://devapi.qweather.com/v7/weather/24h?" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemArray = @[].mutableCopy;
        NSArray *dataArray = [((NSDictionary *)responseObject)objectForKey:@"hourly"];
        for(NSDictionary *info in dataArray){
            GetListItem *list = [[GetListItem alloc] init];
            [list FutureOneDayModelListItemData:info];
            [listItemArray addObject:list];
        }
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}


//未来7天天气数据
- (void)LoadFutureSevenDayListItemBlock:(FutureSevenDayListItemLoadBlock)finishBlock AndLocation:(nonnull NSString *)Location{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"key":@"da76b6a4c7b54f7190968de611731375",
        @"location":Location
    };
    [manager GET:@"https://devapi.qweather.com/v7/weather/7d" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemArray = @[].mutableCopy;
        NSArray *dataArray = [((NSDictionary *)responseObject)objectForKey:@"daily"];
        for(NSDictionary *info in dataArray){
            GetListItem *list = [[GetListItem alloc] init];
            [list FutureSevenDayModelListItemData:info];
            [listItemArray addObject:list];
        }
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

- (void)LoadAirQualityListItemBlock:(AirQualityListItemLoadBlock)finishBlock AndLocation:(NSString *)Location{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"key":@"da76b6a4c7b54f7190968de611731375",
        @"location":@"101010100"
    };

    [manager GET:@"https://devapi.qweather.com/v7/air/now" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemArray = @[].mutableCopy;
        NSDictionary *dic = [((NSDictionary *)responseObject)objectForKey:@"now"];
            GetListItem *list = [[GetListItem alloc] init];
            [list AirQualityModelListItemData:dic];
            [listItemArray addObject:list];
        NSLog(@"");
        
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

- (void)LoadCityListItemBlock:(CityListLoadBlock)finishBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"app_id":@"jqe8ubrioinoutvl",
        @"app_secret":@"eDJ5Z3BvMWpCS1NJWlZXUFlnMUR5dz09"
    };

    [manager GET:@"https://www.mxnzp.com/api/address/v2/list" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemArray = @[].mutableCopy;
        NSMutableArray *array = [((NSDictionary *)responseObject)objectForKey:@"data"];
        NSDictionary *dicChina = array[0];
        NSMutableArray *ChinaCityArray = [dicChina objectForKey:@"clist"];
        
        for(NSDictionary *info in ChinaCityArray){
            NSString *cityName = [info objectForKey:@"name"];
            
            NSMutableArray *CityLocationArray = @[].mutableCopy;
            CityLocationArray = [[info objectForKey:@"pchilds"][0] objectForKey:@"cchilds"];
            for(NSDictionary *infoLocation in CityLocationArray){
                NSString *locationName = [infoLocation objectForKey:@"name"];
                [listItemArray addObject:[cityName stringByAppendingString:locationName]];
            }
        }
        for(NSDictionary *info in array){
            NSString *strname = [info objectForKey:@"name"];
            [listItemArray addObject:strname];
        }
                
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
    
    
    
    
}







@end
