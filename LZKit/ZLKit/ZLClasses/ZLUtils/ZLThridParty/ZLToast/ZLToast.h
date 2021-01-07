//
//  ZLToast.h
//  ZLKit
//
//  Created by Sunny Leong on 2021/1/6.
//

#import <Foundation/Foundation.h>
#import <Toast/Toast.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZLToastPosition) {
    ZLToastPositionCenter,
    ZLToastPositionTop,
    ZLToastPositionBottom
};

@interface ZLToast : NSObject

/**
 展示Toast
 
 时间：2.0
 方向：center

 @param message 提示信息
 */
+ (void)show:(nullable NSString *)message;

/**
 展示Toast
 
 时间：2.0
 @param message 提示信息
 @param position 方向
 */
+ (void)show:(nullable NSString *)message position:(ZLToastPosition)position;

/**
 展示Toast

 @param message 提示信息
 @param duration 时间
 @param position 方向
 @param title 标题
 @param image 图片
 @param style 类型
 @param inView 展示层视图
 @param completion 回调
 */
+ (void)show:(nullable NSString *)message duration:(NSTimeInterval)duration position:(ZLToastPosition)position title:(nullable NSString *)title image:(nullable UIImage *)image style:(nullable CSToastStyle *)style inView:(nullable UIView *)inView completion:(void(^)(BOOL didTap))completion;

@end

NS_ASSUME_NONNULL_END
