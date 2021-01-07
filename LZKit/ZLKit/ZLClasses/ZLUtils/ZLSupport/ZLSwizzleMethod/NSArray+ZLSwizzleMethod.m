//
//  NSArray+ZLSwizzleMethod.m
//  ZLKit
//
//  Created by Sunny Leong on 2021/1/6.
//

#import "NSArray+ZLSwizzleMethod.h"

@implementation NSArray (ZLSwizzleMethod)

+ (void)load {
    [super load];
    // 无论怎样 都要保证方法只交换一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 交换NSArray中的objectAtIndex方法
        [objc_getClass("__NSArrayI") SystemSelector:@selector(objectAtIndex:) swizzledSelector:@selector(kl_objectAtIndex:) error:nil];
        // 交换NSArray中的 objectAtIndexedSubscript 方法
        [objc_getClass("__NSArrayI") SystemSelector:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(kl_objectAtIndexedSubscript:) error:nil];
    });
}

+ (BOOL)SystemSelector:(SEL)systemSelector swizzledSelector:(SEL)swizzledSelector error:(NSError *)error {
    Method systemMethod = class_getInstanceMethod(self, systemSelector);
    if (!systemMethod) {
        return NO;
    }
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    if (!swizzledMethod) {
        return NO;
    }
    if (class_addMethod([self class], systemSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod([self class], swizzledSelector, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    } else {
        method_exchangeImplementations(systemMethod, swizzledMethod);
    }
    return YES;
}

- (id)kl_objectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return [self kl_objectAtIndex:index];
    } else {
        NSLog(@"NSArray 数组发生越界，已经处理完成。越界下标：%lu，数组大小：%lu", (unsigned long)index, (unsigned long)self.count);
        return nil;
    }
}

- (id)kl_objectAtIndexedSubscript:(NSUInteger)index {
    if (index < self.count) {
        return [self kl_objectAtIndexedSubscript:index];
    } else {
        NSLog(@"NSArray 数组发生越界，已经处理完成。越界下标：%lu，数组大小：%lu", (unsigned long)index, (unsigned long)self.count);
        return nil;
    }
}

@end
