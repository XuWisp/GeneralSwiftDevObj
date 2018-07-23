//
//  UIView+WispFrame.h
//  MagpiePie
//
//  Created by Wisp on 15/11/11.
//  Copyright © 2015年 Yetoon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WispFrame)

//  高度
@property (nonatomic,assign) CGFloat height;
//  宽度
@property (nonatomic,assign) CGFloat width;

//  Y
@property (nonatomic,assign) CGFloat top;
//  X
@property (nonatomic,assign) CGFloat left;

//  Y + Height
@property (nonatomic,assign) CGFloat bottom;
//  X + width
@property (nonatomic,assign) CGFloat right;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

// 水平
- (CGFloat)verticalCentersView:(UIView *)view1 with:(UIView *)view2;
// 截图
- (UIImage *)screenshotWithQuality:(CGFloat)imageQuality;
//判断这个控件是否真正显示在窗口范围内（是否在窗口上，是否为隐藏，是否透明）
- (BOOL)isShowingOnKeyWindow;

@end
