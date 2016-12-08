//
//  HBViewController.m
//  WKWebViewDemo
//
//  Created by Mac on 2016/12/8.
//  Copyright © 2016年 TUTK. All rights reserved.
//

#import "HBViewController.h"

#import <WebKit/WebKit.h>

@interface HBViewController ()<UIWebViewDelegate,WKNavigationDelegate/*WKUIDelegate*/>

@end

@implementation HBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    /**
     先看下 WKWebView的特性：
     在性能、稳定性、功能方面有很大提升（最直观的体现就是加载网页是占用的内存，模拟器加载百度与开源中国网站时，WKWebView占用23M，而UIWebView占用85M）；
     允许JavaScript的Nitro库加载并使用（UIWebView中限制）；
     支持了更多的HTML5特性；
     高达60fps的滚动刷新率以及内置手势；
     将UIWebViewDelegate与UIWebView重构成了14类与3个协议（查看苹果官方文档）；
     
     文／wangyangyang（简书作者）
     原文链接：http://www.jianshu.com/p/6ba2507445e4
     著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。
     */
    
//    100mb+
//    UIWebView *hbWebView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    [self.view addSubview:hbWebView];
//    
//    NSURL *url = [NSURL URLWithString:@"https://www.taobao.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [hbWebView loadRequest:request];
//    
//    hbWebView.delegate = self;
    
//    24mb
    WKWebView *webView = [[WKWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:webView];

    NSURL *url = [NSURL URLWithString:@"https://www.taobao.com"];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    webView.navigationDelegate = self;
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{

    NSLog(@"webViewDidStartLoad----");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad----");
}


-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError----");
}

#pragma mark - WKUIDelegate

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"didStartProvisionalNavigation -----");
}

- (void)webView:(WKWebView *)webView commitPreviewingViewController:(UIViewController *)previewingViewController
{
    NSLog(@"commitPreviewingViewController -----");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"didFinishNavigation -----");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(nonnull NSError *)error
{
    NSLog(@"didFailProvisionalNavigation -----");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
