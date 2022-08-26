//
//  WebLinkViewController.m
//  天气
//
//  Created by 邓杰 on 2022/8/27.
//

#import "WebLinkViewController.h"
#import <WebKit/WebKit.h>

@interface WebLinkViewController ()
@property(nonatomic,strong,readwrite)WKWebView *webview;

@end

@implementation WebLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:({
        self.webview=[[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        self.webview;
    })];

    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://hfx.link/2ax2"]]];
}

@end
