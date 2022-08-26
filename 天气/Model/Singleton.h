//
//  Singleton.h
//  Weather
//
//  Created by 邓杰 on 2022/7/27.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject

@property(nonatomic, strong) CLLocation *SelfLocation;//通过定位获取的本地地址
@property(nonatomic, strong) NSString *SearchLocation;//搜索结果的地址经纬度
@property(nonatomic, strong) NSString *SeatchCityName;//搜索结果的城市名
@property(nonatomic, strong) NSMutableArray *AddCityListArray;//添加城市的列表
@property(nonatomic, strong) NSMutableArray *AddCityNameArray;//城市名
@property(nonatomic, strong) NSMutableArray *AddCityDataArray;//城市数据存储
@property(nonatomic ) BOOL isInSearch;//是否在搜索界面
@property(nonatomic ) int page;//城市的页数
@property(nonatomic,strong)NSMutableArray *HomeArray;//主页信息数组
@property(nonatomic,strong)NSDictionary *WeiboDictionary;//微博详情内容
@property(nonatomic,strong)NSMutableArray *HistoryArray;//浏览历史数组
@property(nonatomic,strong)NSMutableArray *CommentArray;//评论数组
@property(nonatomic,strong)NSMutableArray *PostArray;//发表微博数组
@property(nonatomic,strong)NSMutableArray *CollectArray;//收藏数组
@property(nonatomic,strong)NSMutableArray *SearchArray;//搜索结果数组
@property(nonatomic,strong)NSString *URLString;



@property(nonatomic,strong)NSDictionary *StorageDict; //储存以下数组的字典
@property(nonatomic,strong)NSMutableArray *HotArray;//热门信息数组
@property(nonatomic,strong)NSMutableArray *RecreationArray;//娱乐信息数组
@property(nonatomic,strong)NSMutableArray *EmotionArray;//情感信息数组
@property(nonatomic,strong)NSMutableArray *TravelArray;//旅游信息数组
@property(nonatomic,strong)NSMutableArray *CartoonArray;//漫画信息数组


+ (Singleton *)sharedManager;

@end

NS_ASSUME_NONNULL_END
