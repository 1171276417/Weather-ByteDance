//
//  NetWorkingData.m
//  Weather
//
//  Created by 邓杰 on 2022/8/12.
//

#import "NetWorkingData.h"

@implementation NetWorkingData

///实时天气数据
- (void)LoadRealTimeItemDataBlock:(RealTimeListItemLoadBlock)finishBlock AndLocation:(nonnull NSString *)Location andPage:(int)page{
    
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
        NSString *page1 = [NSString stringWithFormat:@"%d",page];
        [listItemArray addObject:page1];
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }]; 
}


///未来24小时天气数据
- (void)LoadFutureOneDayListItemBlock:(FutureOneDayListItemLoadBlock)finishBlock AndLocation:(nonnull NSString *)Location andPage:(int)page{
    
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
        NSString *page1 = [NSString stringWithFormat:@"%d",page];
        [listItemArray addObject:page1];
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}


///未来7天天气数据
- (void)LoadFutureSevenDayListItemBlock:(FutureSevenDayListItemLoadBlock)finishBlock AndLocation:(nonnull NSString *)Location andPage:(int)page{
    
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
        NSString *page1 = [NSString stringWithFormat:@"%d",page];
        [listItemArray addObject:page1];
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

///空气质量数据
- (void)LoadAirQualityListItemBlock:(AirQualityListItemLoadBlock)finishBlock AndLocation:(NSString *)Location andPage:(int)page{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"key":@"da76b6a4c7b54f7190968de611731375",
        @"location":Location
    };

    [manager GET:@"https://devapi.qweather.com/v7/air/now" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemArray = @[].mutableCopy;
        NSDictionary *dic = [((NSDictionary *)responseObject)objectForKey:@"now"];
            GetListItem *list = [[GetListItem alloc] init];
            [list AirQualityModelListItemData:dic];
            [listItemArray addObject:list];
        NSLog(@"");
        NSString *page1 = [NSString stringWithFormat:@"%d",page];
        [listItemArray addObject:page1];
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

///生活指数数据
- (void)LoadLivingListItemBlock:(LivingListLoadBlock)finishBlock AndLocation:(NSString *)Location{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"key":@"da76b6a4c7b54f7190968de611731375",
        @"location":Location,
        @"type":@"0"
    };
    [manager GET:@"https://devapi.qweather.com/v7/indices/1d" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemArray = @[].mutableCopy;
        NSDictionary *dic = [((NSDictionary *)responseObject)objectForKey:@"daily"];
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

#pragma mark -城市列表获取
///城市列表获取
- (void)LoadCityListItemBlock:(CityListLoadBlock)finishBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"app_id":@"jqe8ubrioinoutvl",
        @"app_secret":@"eDJ5Z3BvMWpCS1NJWlZXUFlnMUR5dz09"
    };
    [manager GET:@"https://www.mxnzp.com/api/address/v2/list" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemArray = @[].mutableCopy;
        NSMutableArray *array = [((NSDictionary *)responseObject)objectForKey:@"data"];//国家列表
        NSDictionary *dicChina = array[0];//中国
        NSMutableArray *ChinaCityArray = [dicChina objectForKey:@"clist"];//中国34个省
        for(NSDictionary *info in ChinaCityArray){
            NSString *ProvinceName = [info objectForKey:@"name"];//省列表
            
            NSMutableArray *CityLocationArray = @[].mutableCopy;
            if((info == ChinaCityArray[0]) || (info == ChinaCityArray[1]) || (info == ChinaCityArray[8]) || (info == ChinaCityArray[21])){
                //四个直辖市
                CityLocationArray = [[info objectForKey:@"pchilds"][0] objectForKey:@"cchilds"];
                for(NSDictionary *infoLocation in CityLocationArray){
                    NSString *locationName = [infoLocation objectForKey:@"name"]; //区名
                    [listItemArray addObject:[ProvinceName stringByAppendingString:locationName]];
                }
            }
            else{
                //非直辖市
                CityLocationArray = [info objectForKey:@"pchilds"];//地级市列表
                for(NSDictionary *infoCity in CityLocationArray){
                    NSString *CityName = [infoCity objectForKey:@"name"]; //地级市名
                    NSMutableArray *LocationArray = @[].mutableCopy;
                    LocationArray = [infoCity objectForKey:@"cchilds"];//区列表
                    for(NSDictionary *infoLocation in LocationArray){
                        NSString *LocationName = [infoLocation objectForKey:@"name"];//区名
                        [listItemArray addObject:[[ProvinceName stringByAppendingString:CityName] stringByAppendingString:LocationName]];
                    }
                }
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

#pragma mark -生活资讯
extern NSString *access_token = @"2.00b5biSHqpMClB6963486d9cjFixpC";

/**获取微博内容数据*/
- (void)LoadListDataBlock:(WeiboListItemLoadBlock)finishBlock andpage:(int)page{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"access_token":access_token,
        @"page":[NSNumber numberWithInt:page]
    };
    [manager GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemArray = @[].mutableCopy;
        NSArray *dataArray = [((NSDictionary *)responseObject)objectForKey:@"statuses"];
        for(NSDictionary *info in dataArray){
            GetListItem *list = [[GetListItem alloc] init];
            [list WeiboconfigWithDictionary:info];
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

/**获取微博评论数据*/
- (void)LoadCommentListDataBlock:(CommentListItemLoadBlock)finishBlock andID:(NSNumber *)ID{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"access_token":access_token,
        @"id":ID
    };
    [manager GET:@"https://api.weibo.com/2/comments/show.json" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemCommentArray = @[].mutableCopy;
        NSArray *CommentArray = [((NSDictionary *)responseObject)objectForKey:@"comments"];
        for(NSDictionary *info in CommentArray){
            GetListItem *list = [[GetListItem alloc] init];
            [list CommentconfigwithDictionary:info];
            [listItemCommentArray addObject:list];
        }
        NSLog(@"");
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemCommentArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}


/**获取微博网页数据*/
- (void)LoadSelectionListDataBlock:(SelectionListItemLoadBlock)finishBlock URL:(NSString *)URL andPage:(int)page{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSDictionary *header = @{@"User-Agent":@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Safari/605.1.15"};
    NSString *stringpage = [NSString stringWithFormat:@"%d",page];
    NSString *url1 = [URL stringByAppendingString:@"&refresh="];
    NSString *url = [url1 stringByAppendingString:stringpage];

    
    [manager GET:url parameters:nil headers:header progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemSelectionArray = @[].mutableCopy;
        NSArray *SelectionArray = [((NSDictionary *)responseObject)objectForKey:@"statuses"];
        for(NSDictionary *info in SelectionArray){
            GetListItem *list = [[GetListItem alloc] init];
            [list WeiboconfigWithDictionary:info];
            [listItemSelectionArray addObject:list];
        }
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemSelectionArray.copy);
            }
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
    }];
}

- (void)LoadSelectionCommentBlock:(SelectionCommentBlock)finishBlock andid:(NSString *)ID uid:(NSString *)uid{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url1 = @"https://weibo.com/ajax/statuses/buildComments?is_reload=1&is_show_bulletin=2&is_mix=0&count=20&type=feed&";
    NSString *url2 = [url1 stringByAppendingString:@"id="];
    NSString *url3 = [url2 stringByAppendingString:ID];
    NSString *url4 = [url3 stringByAppendingString:@"&uid="];
    NSString *URL = [url4 stringByAppendingString:uid];
    NSDictionary *header = @{@"User-Agent":@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Safari/605.1.15"};
    [manager GET:URL parameters:nil headers:header progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemCommentArray = @[].mutableCopy;
        NSArray *CommentArray = [((NSDictionary *)responseObject)objectForKey:@"data"];
        for(NSDictionary *info in CommentArray){
            GetListItem *list = [[GetListItem alloc] init];
            [list CommentconfigwithDictionary:info];
            [listItemCommentArray addObject:list];
        }
        NSLog(@"");
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemCommentArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];


    

}






@end
