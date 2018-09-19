//
//  SEInputView.m
//  Bname
//
//  Created by iMac Maxt on 2018/8/3.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#define kHeight ([UIScreen mainScreen].bounds.size.height)

#import "SEInputView.h"
#import <UIView+CCCategory.h>
#import <UIColor+CCCategory.h>
#import "SEButton.h"

@interface SEInputView () <UITextFieldDelegate>

@property (nonatomic, strong) UIView   *lineView1;
@property (nonatomic, strong) SEButton *cancelBT;

@end
@implementation SEInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self lineView1];
        [self inputhField];
        [self cancelBT];
        
        /* 增加监听（当键盘出现或改变时） */
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        
    }
    return self;
}

- (UIView *)lineView1 {
    if (!_lineView1) {
        _lineView1 = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, self.width, 0.5)];
        _lineView1.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_lineView1];
    }
    return _lineView1;
}

- (UITextField *)inputhField
{
    if (!_inputhField) {
        _inputhField = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, self.width-10-64, self.height)];
        [_inputhField addTarget:self action:@selector(textFieldDidEditing:) forControlEvents:UIControlEventEditingChanged];

        _inputhField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:_inputhField];
    }
    return _inputhField;
}

- (SEButton *)cancelBT
{
    if (!_cancelBT) {
        _cancelBT = [[SEButton alloc] initWithFrame:CGRectMake(self.inputhField.maxX, 0, 64, 32)];
        _cancelBT.centerY = self.height/2;
        [_cancelBT setTitle:@"确定" forState:(UIControlStateNormal)];
        [_cancelBT addTarget:self action:@selector(eventTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [_cancelBT setTitleColor:[UIColor colorWithString:@"#9B9B9B"] forState:(UIControlStateNormal)];
        //设置圆角边框
        _cancelBT.layer.cornerRadius = 5;
        _cancelBT.layer.masksToBounds = YES;
        //设置边框及边框颜色
        _cancelBT.layer.borderWidth = 1;
        _cancelBT.layer.borderColor = [[UIColor colorWithString:@"#9B9B9B"] CGColor];
        [self addSubview:_cancelBT];
    }
    return _cancelBT;
}

- (IBAction)eventTouchUpInside:(SEButton *)sender
{
    
    if (self.inputViewTouchEventBlock) {
        self.inputViewTouchEventBlock(self.inputhField.text);
    }
}

//文本改变时调用
- (void)textFieldDidEditing:(UITextField *)textField
{
    if (self.textFieldDidEditiongBlock) {
        self.textFieldDidEditiongBlock(textField.text);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    
    [self.inputhField resignFirstResponder];//辞去第一响应
}

- (void)setActivate:(BOOL)activate
{
    if (!activate) {
        [self.inputhField resignFirstResponder];//辞去第一响应
    } else {
        [self.inputhField becomeFirstResponder];
    }
}

/**
 *  键盘弹出
 */
- (void)keyboardWillShow:(NSNotification *)aNotification {
    
    /* 获取键盘的高度 */
    NSDictionary *userInfo = aNotification.userInfo;
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = aValue.CGRectValue;
    
    /* 输入框上移 */
    CGFloat padding = 20;
    CGRect frame = self.frame;
    CGFloat height = kHeight - frame.origin.y - frame.size.height;
    if (height < keyboardRect.size.height + padding) {
        
        [UIView animateWithDuration:0.15 animations:^ {
            
            CGRect frame = self.frame;
            frame.origin.y = -(keyboardRect.size.height - height + padding);
            self.frame = frame;
        }];
    }
}



- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
