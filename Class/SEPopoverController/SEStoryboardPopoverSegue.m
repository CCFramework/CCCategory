//
//  SEStoryboardPopoverSegue.h
//  bname
//
//  Created by iMac Maxt on 2018/7/25.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEStoryboardPopoverSegue.h"


////////////////////////////////////////////////////////////////////////////

@interface SEStoryboardPopoverSegue()
{
    SEPopoverController *popoverController;
    id sender;
    SEPopoverArrowDirection arrowDirections;
    SEPopoverAnimationOptions options;
    BOOL animated;
}

@end

////////////////////////////////////////////////////////////////////////////

@implementation SEStoryboardPopoverSegue

- (void)perform
{
    if ([sender isKindOfClass:[UIBarButtonItem class]])
    {
        [popoverController presentPopoverFromBarButtonItem:(UIBarButtonItem*)sender
                                  permittedArrowDirections:arrowDirections
                                                  animated:animated
                                                   options:options];
    }
    else
    {
        UIView *view = (UIView *)sender;
        [popoverController presentPopoverFromRect:view.bounds
                                           inView:view
                         permittedArrowDirections:arrowDirections
                                         animated:animated
                                          options:options];
    }
}

- (SEPopoverController *)popoverControllerWithSender:(id)aSender
                            permittedArrowDirections:(SEPopoverArrowDirection)aArrowDirections
                                            animated:(BOOL)aAnimated
{
    return [self popoverControllerWithSender:aSender
                    permittedArrowDirections:aArrowDirections
                                    animated:aAnimated
                                     options:SEPopoverAnimationOptionFade];
}

- (SEPopoverController *)popoverControllerWithSender:(id)aSender
                            permittedArrowDirections:(SEPopoverArrowDirection)aArrowDirections
                                            animated:(BOOL)aAnimated
                                             options:(SEPopoverAnimationOptions)aOptions
{
    sender = aSender;
    arrowDirections = aArrowDirections;
    animated = aAnimated;
    options = aOptions;
    
    popoverController = [[SEPopoverController alloc] initWithContentViewController:self.destinationViewController];
    
    return popoverController;
}

- (void)dealloc
{
    sender = nil;
    popoverController = nil;
}

@end
