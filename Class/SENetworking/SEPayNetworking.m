//
//  SEPayNetworking.m
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEPayNetworking.h"

@implementation SEPayNetworking

//创建订单
///action/orderinfo/save
- (void)orderinfoAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/orderinfo/save" parameters:parameters success:success failure:failure];
}


//商品全查（上架商品）
///action/goods/getAll
- (void)getAllGoodsAtParameters:(id)parameters
                        success:(NetworkingSuccessBlock)success
                        failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/goods/getAll" parameters:parameters success:success failure:failure];
}



//微信支付
///action/pay/weixinPay
- (void)weixinPayAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/pay/weixinPay" parameters:parameters success:success failure:failure];
}


//支付宝支付
///action/pay/aliPay
- (void)aliPayAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/pay/aliPay" parameters:parameters success:success failure:failure];
}

//订单支付情况查询
///action/pay/PaySelect
- (void)paySelectAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/pay/PaySelect" parameters:parameters success:success failure:failure];
}

//生成修改别名订单
///action/orderinfo/saveAliasUpdateOrder
- (void)saveAliasUpdateOrderAtParameters:(id)parameters
                                 success:(NetworkingSuccessBlock)success
                                 failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/orderinfo/saveAliasUpdateOrder" parameters:parameters success:success failure:failure];
}

//生成增加别名槽订单
///action/orderinfo/saveAliasCaoOrder
- (void)saveAliasCaoOrderAtParameters:(id)parameters
                              success:(NetworkingSuccessBlock)success
                              failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/orderinfo/saveAliasCaoOrder" parameters:parameters success:success failure:failure];
}

@end
