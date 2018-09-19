//
//  SEKeyboardTextView.m
//  bname
//
//  Created by 李飞恒 on 2018/9/16.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEKeyboardTextView.h"

//通知中心
#define kNotificationCenter [NSNotificationCenter defaultCenter]

static CGFloat const ANIMATION_DURATION = 0.25;

@interface SEKeyboardTextView ()

@property (nonatomic, strong) UILabel *placeHolderLabel;

@end
@implementation SEKeyboardTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textContainerInset = UIEdgeInsetsMake(9, 3, 0, 0);
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textChanged:(NSNotification *)notification
{
    if([[self placeholder] length] == 0)
    {
        return;
    }
    
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        if([[self text] length] == 0)
        {
            [[self viewWithTag:999] setAlpha:1];
        }
        else
        {
            [[self viewWithTag:999] setAlpha:0];
        }
    }];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)drawRect:(CGRect)rect
{
    if( [[self placeholder] length] > 0 )
    {
        if (_placeHolderLabel == nil )
        {
            _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            _placeHolderLabel.lineBreakMode   = NSLineBreakByWordWrapping;
            _placeHolderLabel.numberOfLines   = 1;
            _placeHolderLabel.textAlignment   = NSTextAlignmentRight;
            _placeHolderLabel.font            = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor       = self.placeholderColor;
            _placeHolderLabel.alpha           = 0;
            _placeHolderLabel.tag             = 999;
            [self addSubview:_placeHolderLabel];
            _placeHolderLabel.sd_layout
            .heightIs(21)
            .topSpaceToView(self, 7)
            .leftSpaceToView(self, 12)
            .rightSpaceToView(self, 12);
            
        }
        
        _placeHolderLabel.text = self.placeholder;
        [_placeHolderLabel sizeToFit];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 )
    {
        [[self viewWithTag:999] setAlpha:1];
    }
    
    [super drawRect:rect];
}

- (CGSize)latestHeight
{
    return [self.text sizeWithFont:self.font forWidth:self.width-(14)];
}


@end
