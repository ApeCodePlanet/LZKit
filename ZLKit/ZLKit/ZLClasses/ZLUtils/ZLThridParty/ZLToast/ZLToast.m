//
//  ZLToast.m
//  ZLKit
//
//  Created by Sunny Leong on 2021/1/6.
//

#import "ZLToast.h"

static ZLToast *_instance = nil;

@implementation ZLToast

+ (void)show:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[ZLToast sharedToast] show:message duration:[[ZLToast sharedToast] defaultInterval] position:ZLToastPositionCenter title:nil image:nil style:nil inView:nil completion:nil];
    });
}

+ (void)show:(NSString *)message position:(ZLToastPosition)position {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[ZLToast sharedToast] show:message duration:[[ZLToast sharedToast] defaultInterval] position:position title:nil image:nil style:nil inView:nil completion:nil];
    });
}

+ (void)show:(NSString *)message duration:(NSTimeInterval)duration position:(ZLToastPosition)position title:(NSString *)title image:(UIImage *)image style:(CSToastStyle *)style inView:(UIView *)inView completion:(void (^)(BOOL))completion {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[ZLToast sharedToast] show:message duration:duration position:position title:title image:image style:style inView:inView completion:completion];
    });
}

#pragma mark - ✮✮✮✮✮✮【 Private Methods 】✮✮✮✮✮✮

+ (instancetype)sharedToast {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[ZLToast alloc] init];
    });
    return _instance;
}

- (void)show:(NSString *)message duration:(NSTimeInterval)duration position:(ZLToastPosition)position title:(NSString *)title image:(UIImage *)image style:(CSToastStyle *)style inView:(UIView *)inView completion:(void(^)(BOOL didTap))completion {
    if (inView == nil) {
        inView = [[UIApplication sharedApplication].windows firstObject];
    }
    [inView hideAllToasts];
    // 方向
    id pos = CSToastPositionCenter;
    if (position == ZLToastPositionTop) {
        pos = CSToastPositionTop;
    }
    if (position == ZLToastPositionBottom) {
        pos = CSToastPositionBottom;
    }
    // 时间
    if (duration <= 0) {
        duration = [self defaultInterval];
    }
    
    [inView makeToast:message duration:duration position:pos title:title image:image style:style completion:completion];
}

- (NSTimeInterval)defaultInterval {
    return 2.0;
}

@end
