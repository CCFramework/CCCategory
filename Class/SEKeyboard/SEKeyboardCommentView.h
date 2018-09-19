//
//  SEKeyboardCommentView.h
//  bname
//
//  Created by 李飞恒 on 2018/9/16.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChangeTextActionBlock)(NSString *text,CGRect frame);
typedef void(^SendActionBlock)(void);
@interface SEKeyboardCommentView : UIView

@property (nonatomic, copy) SendActionBlock sendActionBlock;

@property (nonatomic, copy) ChangeTextActionBlock changeTextActionBlock;



+ (instancetype)sharedInstance;

- (void)showTextView;

- (void)hideTextView;

- (void)resetView;


@end
