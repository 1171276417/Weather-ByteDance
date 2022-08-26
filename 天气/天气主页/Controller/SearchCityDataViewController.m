//
//  SearchCityDataViewController.m
//  天气
//
//  Created by 邓杰 on 2022/8/25.
//

#import "SearchCityDataViewController.h"
#import "ChildViewController.h"
#import "Singleton.h"


@interface SearchCityDataViewController ()
@property(nonatomic, strong)ChildViewController *childVC;
@property(nonatomic, strong)Singleton *single;

@end

@implementation SearchCityDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];


    _single = [Singleton sharedManager];
    _single.page = 0;

    _childVC = [[ChildViewController alloc] init];
    [self addChildViewController:_childVC];
    [_childVC.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_childVC.view];
    [_childVC didMoveToParentViewController:self];
    [self.view setNeedsLayout];



}


@end
