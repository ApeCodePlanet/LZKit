//
//  NSObject+ZLSwizzleMethod.m
//  ZLKit
//
//  Created by Sunny Leong on 2021/1/6.
//

#import "NSObject+ZLSwizzleMethod.h"

@implementation NSObject (ZLSwizzleMethod)

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


@end
