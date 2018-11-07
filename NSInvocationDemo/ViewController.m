#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建 SEL 方法 二选一即可
//    SEL selector = @selector(foo::);
    SEL selector1 = NSSelectorFromString(@"foo::");
    
    //---------------- 开始 获取方法签名 ----------------//
    NSMethodSignature *sign = [self methodSignatureForSelector:selector1];
    NSLog(@"numberOfArguments:%lu",sign.numberOfArguments);
    NSLog(@"frameLength:%lu",sign.frameLength);
    NSLog(@"isOneway:%d",[sign isOneway]);
    NSLog(@"methodReturnType:%s",[sign methodReturnType]);
    NSLog(@"methodReturnLength:%lu",[sign methodReturnLength]);

    
    //---------------- 结束 获取方法签名 ----------------//

    // 通过 方法签名创建 Invocation 对象
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sign];
    
    // 方法选择器 必传参数
    invocation.selector = selector1;

    
    //---------------- 开始 设置函数参数 ----------------//
    // 备注: 索引0和1分别表示隐藏的参数self和_cmd; 可以使用target和selector方法直接检索这些值。对通常在消息中传递的参数使用索引2和更大。
    // 官方文档: https://developer.apple.com/documentation/foundation/nsinvocation/1437830-getargument?language=objc
    int arg2 = 10;
    [invocation setArgument:&arg2 atIndex:2];
    
    NSString* (^arg3)(NSString *)  = ^NSString* (NSString* va1)
    {
        return va1;
    };
    [invocation setArgument:&arg3 atIndex:3];
    //---------------- 结束 设置函数参数 ----------------//

    // 开始调用
    [invocation invokeWithTarget:self];
    
    
    //---------------- 开始 插入返回值 ----------------//
    NSString *setResult = @"[替换掉方法真正的返回值]";
    [invocation setReturnValue: &setResult];
    //---------------- 结束 插入返回值 ----------------//

    
    
    //---------------- 开始 得到函数返回值 ----------------//
    id result = nil;
    [invocation getReturnValue:&result];
    NSLog(@"方法返回值:%@",result);
    //---------------- 结束 得到函数返回值 ----------------//

    
    
    //---------------- 开始 查看参数 ----------------//
    id _arg0 = nil;
    [invocation getArgument:&_arg0 atIndex:0];
    NSLog(@"arg0:%@",_arg0);

    SEL _arg1 = nil;
    [invocation getArgument:&_arg1 atIndex:1];
    NSLog(@"arg1:%@",NSStringFromSelector(_arg1));
    
    int _arg2;
    [invocation getArgument:&_arg2 atIndex:2];
    NSLog(@"arg2:%d",_arg2);
    
    id _arg3 = nil;
    [invocation getArgument:&_arg3 atIndex:3];
    NSLog(@"arg3:%@",_arg3);
    //---------------- 结束 查看参数 ----------------//

    
//    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

}


//MARK: - 测试函数
- (id)foo: (int) count
                  : (NSString* (^)(NSString *)) block {
    NSLog(@"personalMethod param1:%d, param2:%@",count,block(@"参数2"));
    return @"[真返回值]";
}



@end
