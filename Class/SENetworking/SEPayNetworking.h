//
//  SEPayNetworking.h
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEBaseNetworking.h"

@interface SEPayNetworking : SEBaseNetworking

//创建订单
///action/orderinfo/save
- (void)orderinfoAtParameters:(id)parameters
                        success:(NetworkingSuccessBlock)success
                        failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;


//商品全查（上架商品）
///action/goods/getAll
- (void)getAllGoodsAtParameters:(id)parameters
                        success:(NetworkingSuccessBlock)success
                        failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;



//微信支付
///action/pay/weixinPay
- (void)weixinPayAtParameters:(id)parameters
                        success:(NetworkingSuccessBlock)success
                        failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;


//支付宝支付
///action/pay/aliPay
- (void)aliPayAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//订单支付情况查询
///action/pay/PaySelect
- (void)paySelectAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//生成修改别名订单
///action/orderinfo/saveAliasUpdateOrder
- (void)saveAliasUpdateOrderAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//生成增加别名槽订单
///action/orderinfo/saveAliasCaoOrder
- (void)saveAliasCaoOrderAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;


@end
