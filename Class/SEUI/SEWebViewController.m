//
//  SEWebViewController.m
//  chizhafm
//
//  Created by 李飞恒 on 2017/12/4.
//  Copyright © 2017年 SanshengIT. All rights reserved.
//

#import "SEWebViewController.h"
#import <UIView+CCCategory.h>


@interface SEWebViewController () <UIWebViewDelegate>

@property (nonatomic, copy) NSString *url;

@end

@implementation SEWebViewController


- (instancetype)initWihtURL:(NSString *)url
{
    self = [super init];
    if (self) {
        self.url = url;
    }
    return self;
}

- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        [_webView sizeToFit];
        _webView.scalesPageToFit = YES;
        _webView.scrollView.bounces = NO;
        _webView.delegate = self;
        _webView.frame = self.view.frame;
        [self.view addSubview:_webView];
    }
    return _webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self webView];
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIconString:@"\U0000e629" target:self action:@selector(dismissVC)];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:request];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    [self.webView reload];
}

- (void)dismissVC
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


@end
