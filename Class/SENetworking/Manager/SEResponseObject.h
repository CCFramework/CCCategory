//
//  SEResponseObject.h
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, SEResponseHTTPCode) {
    SEResponseHTTPCode200 = 200,
    
    SEResponseHTTPCode400 = 400,
    SEResponseHTTPCode401 = 401,
    SEResponseHTTPCode500 = 500
};


@interface SEResponseObject : NSObject

@property (nonatomic, copy)   NSString  *token;
/** 如果返回httpCode是200 result才会存在 */
@property (nonatomic, strong) id result;

@property (nonatomic, assign) NSInteger httpCode;

@property (nonatomic, assign) NSInteger timestamp;

@property (nonatomic, copy)   NSString *msg;

@property (nonatomic, assign) NSInteger index;

@end
