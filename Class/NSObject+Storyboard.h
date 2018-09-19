//
//  NSObject+Storyboard.h
//  bname
//
//  Created by iMac Maxt on 2018/8/21.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Storyboard)


- (id)creationStoryboardControllerName:(NSString *)classname name:(NSString *)name;

- (id)creationNibViewWithName:(NSString *)name;

@end
