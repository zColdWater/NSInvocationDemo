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
