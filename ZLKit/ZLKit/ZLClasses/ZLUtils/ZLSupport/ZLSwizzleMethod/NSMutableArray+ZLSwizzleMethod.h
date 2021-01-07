//
//  NSMutableArray+ZLSwizzleMethod.h
//  ZLKit
//
//  Created by Sunny Leong on 2021/1/6.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (ZLSwizzleMethod)

/**
 对系统方法进行替换(交换实例方法)
 
 @param systemSelector 被替换的方法
 @param swizzledSelector 实际使用的方法
 @param error 替换过程中出现的错误消息
 @return YES or NO
 */
+ (BOOL)SystemSelector:(SEL)systemSelector swizzledSelector:(SEL)swizzledSelector error:(nullable NSError *)error;

@end

NS_ASSUME_NONNULL_END
