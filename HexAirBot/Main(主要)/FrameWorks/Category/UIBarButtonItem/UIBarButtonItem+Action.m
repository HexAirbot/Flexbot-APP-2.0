//
//  UIBarButtonItem+Action.m
//  BasicFrame
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

char * const UIBarButtonItemActionBlock = "UIBarButtonItemActionBlock";

#import "UIBarButtonItem+Action.h"
#import <objc/runtime.h>

@implementation UIBarButtonItem (Action)

- (void)performActionBlock
{
    dispatch_block_t block = self.actionBlock;
    
    if (block)
    {
        block();
    }
}

- (BarButtonActionBlock)actionBlock
{
    return objc_getAssociatedObject(self, UIBarButtonItemActionBlock);
}

- (void)setActionBlock:(BarButtonActionBlock)actionBlock
{
    
    if (actionBlock != self.actionBlock)
    {
        [self willChangeValueForKey:@"actionBlock"];
        objc_setAssociatedObject(self, UIBarButtonItemActionBlock, actionBlock, OBJC_ASSOCIATION_COPY);
        
        [self setTarget:self];
        [self setAction:@selector(performActionBlock)];
        
        [self didChangeValueForKey:@"actionBlock"];
    }
}

@end
