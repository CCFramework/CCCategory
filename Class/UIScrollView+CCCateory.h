//
//  UIScrollView+CCCateory.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol UIScrollRefreshDelegate <NSObject>

/**
 *  下拉刷新执行代理
 *
 *  @param tableView 方便调用当前类与父类的TableView属性
 *  @param count     永远等于0
 */
- (void)tableView:(UIScrollView *)tableView refreshWithHeader:(NSInteger)count;

/**
 *  上拉加载执行代理
 *
 *  @param tableView 方便调用当前类与父类的TableView属性
 *  @param count     每执行一次都会+1
 */
- (void)tableView:(UIScrollView *)tableView refreshWithFooter:(NSInteger)count;

@end
@interface UIScrollView (CCCateory)

@end
