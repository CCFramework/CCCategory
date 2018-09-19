//
//  SEWebViewController.h
//  chizhafm
//
//  Created by 李飞恒 on 2017/12/4.
//  Copyright © 2017年 SanshengIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SEWebViewController : UIViewController

@property (nonatomic, strong) UIWebView *webView;

- (instancetype)initWihtURL:(NSString *)url;

@end
