//
//  SEInputView.h
//  Bname
//
//  Created by iMac Maxt on 2018/8/3.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEView.h"


typedef void(^InputViewTouchEventBlock)(NSString *text);
typedef void(^InputViewTextFieldDidEditingBlock)(NSString *text);
@interface SEInputView : SEView

@property (nonatomic, strong) UITextField *inputhField;

@property (nonatomic, copy) InputViewTouchEventBlock inputViewTouchEventBlock;

@property (nonatomic, copy) InputViewTextFieldDidEditingBlock textFieldDidEditiongBlock;

@property (nonatomic, assign) BOOL activate;

@end
