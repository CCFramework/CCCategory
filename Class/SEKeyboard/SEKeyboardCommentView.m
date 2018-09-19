//
//  SEKeyboardCommentView.m
//  bname
//
//  Created by 李飞恒 on 2018/9/16.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEKeyboardCommentView.h"
#import "SEKeyboardTextView.h"

#define MIN_TEXTVIEW_HEIGHT 36
#define MAX_TEXTVIEW_HEIGHT 76
@interface SEKeyboardCommentView()<UITextViewDelegate>

@property (nonatomic, strong) SEKeyboardTextView *textView;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIButton *sendBtn;
@property (nonatomic, assign) CGFloat defaultHeight;
@property (nonatomic, assign) BOOL isKeyBoardShow;
@property (nonatomic) CGRect historyFrame;
@property (nonatomic) BOOL isShowKeyboard;

@property (nonatomic) CGFloat keyboardHeight;

@end
@implementation SEKeyboardCommentView

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static SEKeyboardCommentView *keyboard;
    dispatch_once(&onceToken, ^{
      keyboard = [[SEKeyboardCommentView alloc] initWithFrame:CGRectMake(0, kHeight, kWidth, 55)];
    });
    return keyboard;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
        self.backgroundColor = kColorWhite;
        self.layer.shadowColor = kColorHex(@"#000000").CGColor;
        self.layer.shadowOffset = CGSizeMake(0, -1);
        self.layer.shadowOpacity = 0.1;
        self.layer.shadowRadius = 4;
        self.defaultHeight = frame.size.height;
        BOOL isShowKeyboard = NO;
        //增加监听，当键盘出现或改变时收出消息
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        
        //增加监听，当键退出时收出消息
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
        
        [self sendBtn];
        
        [self textView];
        [self headImageView];
    }
    return self;
}

- (void)keyboardWillShow:(NSNotification *)aNotification
{
    NSLog(@"键盘出现");
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    CGFloat height = keyboardRect.size.height;
    self.keyboardHeight = height;

    self.frame = CGRectMake(0, kHeight - self.keyboardHeight - 55, kWidth, 55);
    
    if (!self.headImageView.image) {
        [self.headImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.offset(0);
        }];
        [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headImageView.mas_right);
        }];
    }
    
}

- (void)keyboardWillHide:(NSNotification *)aNotification
{
    NSLog(@"键盘退出");
    
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    CGFloat height = keyboardRect.size.height;
    
    self.frame = CGRectMake(0, kHeight, kWidth, 55);
    self.textView.text = @"";
    
    [self.textView resignFirstResponder];
    
    
    
}



- (void)showTextView
{
    [self resetView];
    [self.textView becomeFirstResponder];
}

- (void)hideTextView
{
    [self.textView resignFirstResponder];
}

- (void)sendBtnAction
{
    if (self.sendActionBlock) {
        self.sendActionBlock();
    }
}

- (void)resetView
{
    self.frame = CGRectMake(0, kHeight, kWidth, 55);
    
    [self.sendBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-9);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-12);
        make.width.offset(40);
    }];
    [self.headImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(7);
        make.centerY.mas_equalTo(self.sendBtn);
        make.width.height.offset(31);
    }];
    [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.offset(36);
        make.top.mas_equalTo(self).offset(7);
        make.left.mas_equalTo(self.headImageView.mas_right).offset(7);
        make.right.mas_equalTo(self.sendBtn.mas_left).offset(-7);
    }];

    [self.sendBtn setSelected:NO];
}

#pragma mark - textviewDelegate

- (void)textViewDidChange:(SEKeyboardTextView *)textView {
    
    if (textView.text.length) {
        [self.sendBtn setSelected:YES];
        self.sendBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    } else {
        [self.sendBtn setSelected:NO];
        self.sendBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    }

    
    
    CGFloat width = CGRectGetWidth(textView.frame);
    //    CGFloat height = CGRectGetHeight(textView.frame);
    CGSize newSize = [textView sizeThatFits:CGSizeMake(width,MAXFLOAT)];
    CGFloat newHeight = newSize.height;
    if (newHeight < MIN_TEXTVIEW_HEIGHT) {
        newHeight = MIN_TEXTVIEW_HEIGHT;
    }
    if (newHeight >= MAX_TEXTVIEW_HEIGHT) {
        newHeight = MAX_TEXTVIEW_HEIGHT;
    }
    
    self.height = newHeight+19;
    
    if (self.height > self.defaultHeight) {

        self.y = kHeight - self.keyboardHeight - self.height;
    } else {
        self.y = kHeight - self.keyboardHeight - 55;
    }
    
    [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(newHeight);
    }];

    

    if (self.changeTextActionBlock) {
        self.changeTextActionBlock(textView.text,self.frame);
    }
}


 - (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
  replacementText:(NSString *)text {
     
     if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
         //在这里做你响应return键的代码
         //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
         
         
         
         return NO;
     }
     return YES;
 }


//- (void)textViewDidBeginEditing:(UITextView *)textView
//{
//    self.isKeyBoardShow = YES;
//}
//- (void)textViewDidEndEditing:(UITextView *)textView
//{
//    self.isKeyBoardShow = NO;
//}



- (UIButton *)sendBtn
{
    if (!_sendBtn) {
        _sendBtn = [[UIButton alloc] init];
        [_sendBtn setTitleColor:kTitleColor1 forState:UIControlStateNormal];
        [_sendBtn setTitleColor:kTColor forState:UIControlStateSelected];
        [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
        _sendBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_sendBtn addTarget:self action:@selector(sendBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sendBtn];
    }
    return _sendBtn;
}

- (UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
        _headImageView.backgroundColor = kTitleColor1;
        [_headImageView setCornerRadius:kDivision(31)];
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_headImageView];
    }
    return _headImageView;
}

- (SEKeyboardTextView *)textView
{
    if (!_textView) {
        _textView = [[SEKeyboardTextView alloc] init];
        _textView.textAlignment = NSTextAlignmentLeft;
        _textView.font = [UIFont systemFontOfSize:16];
        _textView.returnKeyType = UIReturnKeySend;
        _textView.delegate = self;
        _textView.textColor = kTColor;
        _textView.tintColor = kTColor;
        _textView.placeholder = @"你也来聊两句吧...";
        _textView.placeholderColor = kTitleColor1;
        [_textView setCornerRadius:kDivision(36)];
        _textView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _textView.showsVerticalScrollIndicator = YES;
        [self addSubview:_textView];
    }
    return _textView;
}

@end
