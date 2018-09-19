//
//  NSObject+RefreshExpand.m
//  CZMaster
//
//  Created by 李飞恒 on 2017/12/27.
//  Copyright © 2017年 SANSHENG TECHONLOGY LLC admin@sansehngit.com. All rights reserved.
//

#import "NSObject+RefreshExpand.h"

@implementation UIScrollView (RefreshExpand)



#pragma mark - 下拉刷新
- (void)setHeaderWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:refreshingBlock];
    header.stateLabel.font = [UIFont systemFontOfSize:10];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:10];
    self.mj_header = header;
    [self.mj_header setAutomaticallyChangeAlpha:YES];
}

#pragma mark - 上拉刷新
- (void)setFooterWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock
{
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:refreshingBlock];
    footer.stateLabel.font = [UIFont systemFontOfSize:10];
    [self.mj_footer setAutomaticallyChangeAlpha:YES];
    footer.labelLeftInset = kWidth;
    self.mj_footer = footer;
}




@end
