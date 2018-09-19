//
//  SETextView.m
//  Bname
//
//  Created by iMac Maxt on 2018/8/5.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SETextView.h"
#import "SEButton.h"
#import <UIView+CCCategory.h>

@interface SETextView ()

@property (nonatomic, copy) UILabel *placeholderLabel;

//
@property (nonatomic, strong) UIButton  *empty;

@end
@implementation SETextView

- (UILabel *)placeholderLabel
{
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _placeholderLabel.font = self.font;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChangeNotification) name:UITextViewTextDidChangeNotification object:nil];
        [self addSubview:_placeholderLabel];
    }
    return _placeholderLabel;
}

- (UIButton *)empty
{
    if (!_empty) {
        _empty = [[SEButton alloc] initWithFrame:CGRectMake(0, 0, 21, 21)];
        [_empty setImage:[UIImage imageNamed:@"emptyItem"] forState:(UIControlStateNormal)];
        _empty.contentMode = UIViewContentModeScaleAspectFill;
        _empty.hidden = YES;
        [_empty addTarget:self action:@selector(actionComplaintsEvent) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_empty];
    }
    return _empty;
}


- (void)setShowEmpty:(BOOL)show
{
    if (show) {
        [self.empty setHidden:NO];
    } else {
        [self.empty setHidden:YES];
    }
}

- (void)actionComplaintsEvent
{
    self.text = nil;
    [self resignFirstResponder];
    [self textViewTextDidChangeNotification];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tintColor = kTColor;
    self.placeholderLabel.textColor = kTitleColor1;
    self.placeholderLabel.frame = CGRectMake(5, 8, self.width-10, 21);
    self.empty.center = CGPointMake(self.width-21, self.height-21);
}

- (void)setNeedsLayout
{
    [super setNeedsLayout];
    self.font = self.placeholderLabel.font;
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont
{
    self.placeholderLabel.font = placeholderFont;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    self.placeholderLabel.text = placeholder;
}

- (void)textViewTextDidChangeNotification
{
    if (self.text.length) {
        self.placeholderLabel.alpha = 0;
//        [self.empty setHidden:NO];
    } else {
        self.placeholderLabel.alpha = 1;
//        [self.empty setHidden:YES];
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
