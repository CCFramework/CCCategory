//
//  SEAlertController.h
//  SEUI
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SEAlertModel;
@interface SEAlertController : UIViewController

- (void)actionWithTitle:(nullable NSString *)title detail:(nullable NSString *)detail actionStyle:(UIAlertActionStyle)style handler:(void (^ )(NSInteger page))handler;

@end

@interface SEAlertModel : NSObject

//
@property (nonatomic, copy) NSString *title;

//
@property (nonatomic, copy) NSString *detail;

@end
