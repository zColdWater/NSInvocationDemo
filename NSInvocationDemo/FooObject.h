//
//  FooObject.h
//  NSInvocationDemo
//
//  Created by Yongpeng Zhu 朱永鹏 on 2018/11/20.
//  Copyright © 2018 NIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FooObject : NSObject

- (instancetype)initWithWebView:(UIView *)view;

- (void)sayHello;

@end

NS_ASSUME_NONNULL_END
