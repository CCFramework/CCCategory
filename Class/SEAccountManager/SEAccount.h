//
//  SEAccount.h
//  bname
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEUser.h"
#import "SEUserprogram.h"

@interface SEAccount : NSObject

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *alias;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *token;

@property (nonatomic, strong) SEUser *user;
//SEUserprogram
@property (nonatomic, strong) NSArray <NSDictionary *>*userprogram;

@end
