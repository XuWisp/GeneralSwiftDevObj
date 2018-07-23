//
//  BaseView.h
//  CASAMIEL
//
//  Created by 徐沙洪 on 2018/1/10.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BtnClickDelegate <NSObject>

// 可选方法
@optional
// 方便视图按钮点击 传输到控制器, 设置统一代理
/**
 *  @Description 控制器对视图按钮点击进行的操作
 *  @param 被点击的按钮index
 */
- (void)btnClick:(NSUInteger)index;

@end

@interface BaseView : UIView

@property (nonatomic,weak) id<BtnClickDelegate> btnClickDelegate;

- (void)setDataWithModel:(id)data;

@end


