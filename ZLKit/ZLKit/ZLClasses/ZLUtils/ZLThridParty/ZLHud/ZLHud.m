//
//  ZLHud.m
//  ZLKit
//
//  Created by Sunny Leong on 2021/1/6.
//

#import "ZLHud.h"

static ZLHud *_instance = nil;

@interface ZLHud ()

@property (nonatomic, strong) MBProgressHUD *HUD;

@end

@implementation ZLHud

+ (void)show {
    [ZLHud show:nil mode:MBProgressHUDModeIndeterminate progress:0.0 inView:nil];
}

+ (void)show:(NSString *)message {
    [ZLHud show:message mode:MBProgressHUDModeIndeterminate progress:0.0 inView:nil];
}

+ (void)show:(NSString *)message mode:(MBProgressHUDMode)mode progress:(float)progress inView:(UIView *)inView {
    [ZLHud dismiss];
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *bgView = [[UIApplication sharedApplication].windows firstObject];
        if (inView) {
            bgView = inView;
        }
        [ZLHud sharedHUD].HUD = [[MBProgressHUD alloc] initWithView:bgView];
        [ZLHud sharedHUD].HUD.removeFromSuperViewOnHide = YES;
        [bgView addSubview:[ZLHud sharedHUD].HUD];
        // 信息
        if (message.length > 0) {
            [ZLHud sharedHUD].HUD.label.text = message;
        }
        // 模式
        [ZLHud sharedHUD].HUD.mode = mode;
        // 进度
        if (progress > 0.0 && progress <= 1.0) {
            [ZLHud sharedHUD].HUD.progress = progress;
        }
        [[ZLHud sharedHUD].HUD showAnimated:YES];
    });
}

+ (void)dismiss {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[ZLHud sharedHUD].HUD hideAnimated:YES];
        [ZLHud sharedHUD].HUD = nil;
    });
}

#pragma mark - ✮✮✮✮✮✮【 Private Methods 】✮✮✮✮✮✮

+ (instancetype)sharedHUD {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[ZLHud alloc] init];
    });
    return _instance;
}

@end
