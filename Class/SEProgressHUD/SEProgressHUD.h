//
//  SEProgressHUD.h
//  bname
//
//  Created by iMac Maxt on 2018/8/26.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SEProgressHUD : NSObject

+ (void)show;

+ (void)hideCompletion:(void (^ __nullable)(BOOL finished))completion;

@end
