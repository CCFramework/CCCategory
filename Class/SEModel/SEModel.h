//
//  SEModel.h
//  SEModel
//
//  Created by jerrylee on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<SEModel/SEModel.h>)
FOUNDATION_EXPORT double SEModelVersionNumber;
FOUNDATION_EXPORT const unsigned char SEModelVersionString[];
#import <SEModel/NSObject+SEModel.h>
#import <SEModel/SEClassInfo.h>
#else
#import "NSObject+SEModel.h"
#import "SEClassInfo.h"
#endif
