//
//  SEStoryboardPopoverSegue.h
//  bname
//
//  Created by iMac Maxt on 2018/7/25.
//  Copyright © 2018年 JerryLee. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SEPopoverController.h"

@interface SEStoryboardPopoverSegue : UIStoryboardSegue

- (SEPopoverController*)popoverControllerWithSender:(id)sender
                           permittedArrowDirections:(SEPopoverArrowDirection)arrowDirections
                                           animated:(BOOL)animated;

- (SEPopoverController*)popoverControllerWithSender:(id)sender
                           permittedArrowDirections:(SEPopoverArrowDirection)arrowDirections
                                           animated:(BOOL)animated
                                            options:(SEPopoverAnimationOptions)options;

@end
