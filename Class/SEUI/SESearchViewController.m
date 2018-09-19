//
//  SESearchViewController.m
//  SEUI
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#define kBounds ([UIScreen mainScreen].bounds)

#define kWidth  ([UIScreen mainScreen].bounds.size.width)

#define kHeight ([UIScreen mainScreen].bounds.size.height)

#define SCREEN_MAX_LENGTH   (MAX(kWidth, kHeight))

#define SCREEN_MIN_LENGTH   (MIN(kWidth, kHeight))

#define kBnameDefineY (kStatusHeight+64)

/**
 状态栏高度
 */
#define kStatusHeight ([UIApplication sharedApplication].statusBarFrame.size.height)

#define kNavigationHeight (kStatusHeight+44)

#define KIphoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size))

#import "SESearchViewController.h"
#import <UIView+CCCategory.h>


@interface SESearchViewController ()

@property (nonatomic, strong) UIView *aview;

@end

@implementation SESearchViewController
static NSInteger left = 10+10+21;
- (UIView *)aview
{
    if (!_aview) {
        _aview = [[UIView alloc] initWithFrame:CGRectMake(5, [UIApplication sharedApplication].statusBarFrame.size.height+64, kWidth-10, 44)];
        //设置圆角边框
        _aview.layer.cornerRadius = _aview.height/2;
        _aview.layer.masksToBounds = YES;
        //设置边框及边框颜色
        _aview.layer.borderWidth = 1;
        _aview.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.5] CGColor];
        [self.view addSubview:_aview];
        
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 21, _aview.height)];
        icon.contentMode = UIViewContentModeScaleAspectFit;
        [icon setImage:[UIImage imageNamed:@"search"]];
        [_aview addSubview:icon];
    }
    return _aview;
}

- (UITextField *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[UITextField alloc] initWithFrame:CGRectMake(left+5, 0, kWidth-10-left-5, self.aview.height)];
//        [_searchBar addTarget:self action:@selector(textFieldDidEditing:) forControlEvents:UIControlEventEditingChanged];
        _searchBar.clearButtonMode = UITextFieldViewModeWhileEditing;
        _searchBar.placeholder = @"搜一搜 更多惊喜";
        _searchBar.clearButtonMode = UITextFieldViewModeWhileEditing;
        _searchBar.font = [UIFont systemFontOfSize:14];
        [self.aview addSubview:_searchBar];
    }
    return _searchBar;
}

- (void)loadView
{
    [super loadView];
    [self searchBar];
    [self aview];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
