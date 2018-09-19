//
//  SETextView.h
//  Bname
//
//  Created by iMac Maxt on 2018/8/5.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SETextView : UITextView

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, strong) UIFont *placeholderFont;

- (void)setShowEmpty:(BOOL)show;


- (void)textViewTextDidChangeNotification;

@end
