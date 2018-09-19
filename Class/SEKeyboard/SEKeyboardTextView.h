//
//  SEKeyboardTextView.h
//  bname
//
//  Created by 李飞恒 on 2018/9/16.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SEKeyboardTextView : UITextView

@property (nonatomic, strong) NSString *placeholder;

@property (nonatomic, strong) UIColor *placeholderColor;

- (void)textChanged:(NSNotification*)notification;

- (CGSize)latestHeight;

@end

