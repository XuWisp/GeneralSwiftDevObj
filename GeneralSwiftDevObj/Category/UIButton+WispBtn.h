//
//  UIButton+WispBtn.h
//  YetoonApp
//
//  Created by 徐沙洪 on 16/4/12.
//  Copyright © 2016年 Yetoon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (WispBtn)

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
                            text:(NSString*)text
                          TColor:(UIColor*)TColor
                            font:(UIFont*)font
                            NImg:(UIImage *)NImg
                            SImg:(UIImage *)SImg
                           BNImg:(UIImage *)BNImg
                           BSImg:(UIImage *)BSImg
                           color:(UIColor *)color;

// 可莎蜜兒确定按钮 初始化要有高度
+ (UIButton *)CSMOKBtnWithFrame:(CGRect)frame;
// 可莎蜜兒 查看更多 按钮 初始化要有高度
+ (UIButton *)CSMMoreBtnWithFrame:(CGRect)frame;


@end
