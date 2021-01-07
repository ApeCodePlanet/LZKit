//
//  ZLHud.h
//  ZLKit
//
//  Created by Sunny Leong on 2021/1/6.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLHud : NSObject

/** 展示HUD */
+ (void)show;

/**
 展示HUD

 @param message 提示信息
 */
+ (void)show:(nullable NSString *)message;

/**
 展示HUD，涉及到HUD的progress，需在主线程执行

 @param message 提示信息
 @param mode 提示器形状
 @param progress 进度, 0.0 ~ 1.0之间，默认0.0
 @param inView 展示层视图，默认 window上
 */
+ (void)show:(nullable NSString *)message mode:(MBProgressHUDMode)mode progress:(float)progress inView:(nullable UIView *)inView;

/** 取消HUD */
+ (void)dismiss;

@end

NS_ASSUME_NONNULL_END
