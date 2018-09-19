//
//  NSObject+RefreshExpand.h
//  CZMaster
//
//  Created by 李飞恒 on 2017/12/27.
//  Copyright © 2017年 SANSHENG TECHONLOGY LLC admin@sansehngit.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJRefresh.h"

@interface UIScrollView (RefreshExpand)

#pragma mark - 下拉刷新
- (void)setHeaderWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;
#pragma mark - 上拉刷新
- (void)setFooterWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;



@end
