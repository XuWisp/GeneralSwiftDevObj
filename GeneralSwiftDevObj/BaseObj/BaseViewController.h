//
//  BaseViewController.h
//  CASAMIEL
//
//  Created by 徐沙洪 on 2017/12/15.
//  Copyright © 2017年 徐沙洪. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <MJRefresh/MJRefresh.h>

//左右导航按钮回调
typedef void(^PassAction)(UIButton *button);

//刷新按钮回调
typedef void(^RefreshAction)(void);

//传值回调
typedef void(^PassStr)(NSString *);

@interface BaseViewController : UIViewController

@property (copy, nonatomic) PassAction leftItemAction;
@property (copy, nonatomic) PassAction rightItemAction;
@property (copy, nonatomic) RefreshAction refreshAction;
@property (copy, nonatomic) PassStr passStr;
@property (strong, nonatomic) UIButton *backBtn;
@property (strong, nonatomic) UILabel *CSMTitleLab;

// push传值
@property (strong, nonatomic) id param;
@property (assign, nonatomic) CGRect NavRect;
@property (assign, nonatomic) CGRect StatusRect;
@property (assign, nonatomic) CGFloat NaviBottom;

#pragma mark 登入状态操作功能
//- (void)pushByLoginWithVC:(UIViewController *)vc;
#pragma mark 界面切换

//topview会出现返回按钮的push
- (void)pushWithBackBtnViewController:(BaseViewController *)vc;

//不需要传参数的push 只需告诉类名字符串
- (void)pushViewControllerWithName:(id)classOrName;
//回到当前模块导航下的某一个页面
- (void)returnViewControllerWithName:(id)classOrName;
//切到指定模块下
- (void)popToHomePageWithTabIndex:(NSInteger)index completion:(void (^)(void))completion;

#pragma mark 左边按钮定制

// CASAMIEL定制返回按钮
- (void)setCSMBackBtn;
// CASAMIEL定制返回按钮(带白色背景)
- (void)initBackBtnWithBG;
/**
 *  显示默认返回按钮
 *
 *  @param title 需要传入上级界面标题
 */
- (void)showBackWithTitle:(NSString *)title;

/**
 *  自定义左边按钮
 *
 *  @param icon     图标 非必填
 *  @param title    标题 非必填
 *  @param selector 事件
 */
- (void)setLeftItemWithIcon:(UIImage *)icon title:(NSString *)title selector:(SEL)selector;
- (UIBarButtonItem *)ittemLeftItemWithIcon:(UIImage *)icon title:(NSString *)title selector:(SEL)selector;

- (void)backAction:(UIButton *)sender;

#pragma mark 右边按钮定制

/**
 *  通过文字设置右侧导航按钮
 *
 *  @param title    文字
 *  @param selector 事件
 */
- (void)setRightItemWithTitle:(NSString *)title selector:(SEL)selector;
- (UIBarButtonItem *)ittemRightItemWithTitle:(NSString *)title selector:(SEL)selector;

/**
 *  通过ico定制右侧按钮
 *
 *  @param icon     图标
 *  @param selector 事件
 */
- (void)setRightItemWithIcon:(UIImage *)icon selector:(SEL)selector;
- (UIBarButtonItem *)ittemRightItemWithIcon:(UIImage *)icon selector:(SEL)selector;

#pragma mark titleView定制
// casemil 定制title
- (void)setCSMTitle:(NSString *)title;
//设置纯文字titleVIew
- (void)setNavigationItemTitleViewWithTitle:(NSString *)title;

/**
 *  设置navigation背景透明
 */
- (void)setNavigationBackGroudDiaphanous;

/**
 *  设置navigation背景不透明
 */
- (void)setNavigationBackGroudOpaque;


- (id)initWithBarHeight:(CGFloat)barHeight;


#pragma mark - 小红点

/**
 *  小红点View定制
 *
 *  @param redDotValue <#redDotValue description#>
 *
 *  @return <#return value description#>
 */
- (UIView *)ittemRedViewWithRedDotValue:(NSString *)redDotValue;

#pragma mark - MJRefresh
//- (MJRefreshNormalHeader *)setRefreshNormalHeaderParameter:(MJRefreshNormalHeader *)header;
//- (MJRefreshBackNormalFooter *)setRefreshBackNormalFooterParameter:(MJRefreshBackNormalFooter *)footer;
//- (MJRefreshAutoNormalFooter *)setRefreshAutoNormalFooterParameter:(MJRefreshAutoNormalFooter *)footer;

#pragma mark - network

// 页面出现是自动刷新
- (void)refreshInfo;

@end
