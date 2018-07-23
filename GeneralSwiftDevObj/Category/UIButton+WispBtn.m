//
//  UIButton+WispBtn.m
//  YetoonApp
//
//  Created by 徐沙洪 on 16/4/12.
//  Copyright © 2016年 Yetoon. All rights reserved.
//

#import "UIButton+WispBtn.h"

@implementation UIButton (WispBtn)

/**
 *  快捷创建Btn
 *
 *  @param Type   UIButtonType
 *  @param frame  Btn.frame
 *  @param text   text
 *  @param TColor text color
 *  @param font   text font
 *  @param NImg   setimage for normal
 *  @param SImg   setimage for selected
 *  @param BNImg  setBackGroudImage for normal
 *  @param BSImg  setBackGroudImage for selected
 *  @param color  setBackGroudColor
 *
 *  @return Btn
 */
+ (UIButton *)commonBtnWithType:(UIButtonType)type
                          Frame:(CGRect)frame
                           text:(NSString *)text
                         TColor:(UIColor *)TColor
                           font:(UIFont *)font
                           NImg:(UIImage *)NImg
                           SImg:(UIImage *)SImg
                          BNImg:(UIImage *)BNImg
                          BSImg:(UIImage *)BSImg
                          color:(UIColor *)color {
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setTitle:text forState:(UIControlStateNormal)];
    [btn setTitleColor:TColor forState:(UIControlStateNormal)];
    btn.titleLabel.font = font;
    [btn setImage:NImg forState:(UIControlStateNormal)];
    [btn setImage:SImg forState:(UIControlStateSelected)];
    [btn setBackgroundImage:BNImg forState:(UIControlStateNormal)];
    [btn setBackgroundImage:BSImg forState:(UIControlStateSelected)];
    [btn setBackgroundColor:color];
    return btn;
}

// 可莎蜜兒确定按钮
+ (UIButton *)CSMOKBtnWithFrame:(CGRect)frame {
    UIButton *btn = [UIButton commonBtnWithType:(UIButtonTypeCustom)
                                          Frame:frame
                                           text:@""
                                         TColor:[UIColor whiteColor]
                                           font:nil
                                           NImg:nil
                                           SImg:nil
                                          BNImg:nil
                                          BSImg:nil
                                          color:nil];
//    btn.layer.cornerRadius = btn.height/2;
//    btn.centerX = kScreenW/2;
//    btn.cs_acceptEventTime = 1;
    return btn;
}

// 可莎蜜兒 查看更多 按钮
+ (UIButton *)CSMMoreBtnWithFrame:(CGRect)frame {
    UIButton *btn = [UIButton commonBtnWithType:(UIButtonTypeCustom)
                                          Frame:frame
                                           text:@"查看更多 >"
                                         TColor:nil
                                           font:nil
                                           NImg:nil
                                           SImg:nil
                                          BNImg:nil
                                          BSImg:nil
                                          color:[UIColor whiteColor]];
    return btn;
}


//- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
//    [super addTarget:target action:action forControlEvents:controlEvents];
//    [self performSelector:@select(buttonenabled＝ YES) withObject:nil afterDelay:1.0f];
//}

@end
