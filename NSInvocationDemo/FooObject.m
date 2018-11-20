//
//  FooObject.m
//  NSInvocationDemo
//
//  Created by Yongpeng Zhu 朱永鹏 on 2018/11/20.
//  Copyright © 2018 NIO. All rights reserved.
//

#import "FooObject.h"
#import <UIKit/UIKit.h>

@implementation FooObject

- (instancetype)initWithWebView:(UIView *)view
{
    self = [super init];
    if(self) {
        NSLog(@"initWithWebView_init: %@", self);
    }
    return self;
}

- (void)sayHello {
    NSLog(@"sayHello");
}

@end
