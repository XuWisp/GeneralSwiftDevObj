//
//  BaseViewController.m
//  CASAMIEL
//
//  Created by 徐沙洪 on 2017/12/15.
//  Copyright © 2017年 徐沙洪. All rights reserved.
//

#import "BaseViewController.h"

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    // 状态栏底色
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = [UIColor blackColor];
    }
    // 状态栏字色
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    [self refreshInfo];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithBarHeight:(CGFloat)barHeight {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
//        self.barHight = barHeight;
    }
    return self;
}

#pragma mark titleView定制

- (void)setNavigationBarTitle:(NSString *)title {
    
}

- (void)setCSMTitle:(NSString *)title {
//    self.CSMTitleLab = [UILabel commonLabelWithFrame:CGRectMake(kScreenW/4, self.NavRect.origin.y + kImg(38), kScreenW/2, kImg(60))
//                                                 text:title
//                                                color:[UIColor blackColor]
//                                                 font:[UIFont boldSystemFontOfSize:kImg(60)]
//                                        textAlignment:(NSTextAlignmentCenter)];
//    [self.view addSubview:self.CSMTitleLab];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

/**
 *  设置navigation背景透明
 */
- (void)setNavigationBackGroudDiaphanous {
    //设置背景透明图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去掉 bar 下面有一条黑色的线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

/**
 *  设置navigation背景不透明
 */
- (void)setNavigationBackGroudOpaque {
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

#pragma mark ===== leftBarButton

- (void)setCSMBackBtn {
    [self.view addSubview:self.backBtn];
}

#pragma mark - 回到导航Index

- (void)popToHomePageWithTabIndex:(NSInteger)index
                       completion:(void (^)(void))completion
{
    UIWindow *keyWindow = [[UIApplication sharedApplication].windows objectAtIndex:0];
    NSInteger viewIndex = 0;
    for (UIView *view in keyWindow.subviews)
    {
        if (viewIndex > 0)
        {
            [view removeFromSuperview];
        }
        viewIndex++;
    }
    
    self.tabBarController.selectedIndex = index;
    if ([self.tabBarController presentedViewController]) {
        [self.tabBarController dismissViewControllerAnimated:NO completion:^{
            for (UINavigationController *nav in self
                 .tabBarController.viewControllers) {
                [nav popToRootViewControllerAnimated:NO];
            }
            if (completion)
                completion();
        }];
    } else {
        for (UINavigationController *nav in self
             .tabBarController.viewControllers) {
            [nav popToRootViewControllerAnimated:NO];
        }
        if (completion)
            completion();
    }
}

- (void)pushViewControllerWithName:(id)classOrName {
    if (classOrName) {
        Class classs;
        if ([classOrName isKindOfClass:[NSString class]]) {
            NSString *name = classOrName;
            classs = NSClassFromString(name);
        } else if ([classOrName isSubclassOfClass:[BaseViewController class]]) {
            classs = classOrName;
        }
        
        UIViewController *vc = [classs new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)returnViewControllerWithName:(id)classOrName {
    if (classOrName) {
        Class classs;
        if ([classOrName isKindOfClass:[NSString class]]) {
            NSString *name = classOrName;
            classs = NSClassFromString(name);
        } else if ([classOrName isSubclassOfClass:[BaseViewController class]]) {
            classs = classOrName;
        }
        
        [self.navigationController.viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:classs]) {
                [self.navigationController popToViewController:obj animated:YES];
                *stop = YES;
                return;
            }
        }];
    }
}

- (void)pushWithBackBtnViewController:(BaseViewController *)vc {
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 导航定制

- (void)showBack {
    if (self.navigationController.viewControllers.count > 1) {
        UIViewController *vc = self.navigationController.viewControllers[self.navigationController.viewControllers.count - 2];
        if (vc.title.length > 0) {
            [self showBackWithTitle:vc.title];
        } else {
            [self showBackWithTitle:vc.navigationItem.title];
        }
    }
}

- (UIView *)ittemRedViewWithRedDotValue:(NSString *)redDotValue {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor redColor];
    label.text = redDotValue;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    float leight = 20;
    float height = 20;
    if (redDotValue.intValue > 9) {
        leight = 30;
        height = 20;
    }
    label.layer.cornerRadius = height/2;
    label.layer.masksToBounds = YES;
    label.frame = CGRectMake(0, 0, leight, height);
    
    view.frame = CGRectMake(0, 0, leight, height);
    [view addSubview:label];
    return view;
}

- (void)setNavigationItemTitleViewWithTitle:(NSString *)title {
    self.navigationItem.titleView = nil;
    if (title.length == 0) {
        return;
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    self.navigationItem.titleView = btn;
}

- (void)showBackWithTitle:(NSString *)title {
//    NSString *imageName = @"back_more1";
//    if (kStatusBarStyle == UIStatusBarStyleLightContent) {
//        imageName = @"back_more";
//    }
//    [self setLeftItemWithIcon:[UIImage imageNamed:imageName] title:title selector:@selector(backAction:)];
}

- (void)setLeftItemWithIcon:(UIImage *)icon title:(NSString *)title selector:(SEL)selector {
    self.navigationItem.leftBarButtonItem = [self ittemLeftItemWithIcon:icon title:title selector:selector];
}

- (UIBarButtonItem *)ittemLeftItemWithIcon:(UIImage *)icon title:(NSString *)title selector:(SEL)selector {
    UIBarButtonItem *item;
    if (!icon && title.length == 0) {
        item = [[UIBarButtonItem new] initWithCustomView:[UIView new]];
        return item;
    }
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    if (selector) {
        [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    if (icon) {
        [btn setImage:icon forState:UIControlStateNormal];
        [btn setImage:icon forState:UIControlStateHighlighted];
        if (title.length == 0) {
            //文字没有的话，点击区域+10
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -13, 0, 13);
        } else {
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 3);
        }
    }
    if (title.length == 0) {
        //文字没有的话，点击区域+10
//        leight = leight + 10;
    }
//    view.frame = CGRectMake(0, 0, leight, 30);
//    btn.frame = CGRectMake(-5, 0, leight, 30);
    [view addSubview:btn];
    
    item = [[UIBarButtonItem alloc] initWithCustomView:view];
    return item;
}

- (void)setRightItemWithTitle:(NSString *)title selector:(SEL)selector {
    UIBarButtonItem *item = [self ittemRightItemWithTitle:title selector:selector];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)setRightItemWithIcon:(UIImage *)icon selector:(SEL)selector {
    UIBarButtonItem *item = [self ittemRightItemWithIcon:icon selector:selector];
    self.navigationItem.rightBarButtonItem = item;
}

- (UIBarButtonItem *)ittemRightItemWithIcon:(UIImage *)icon selector:(SEL)selector {
    UIBarButtonItem *item;
    if (!icon) {
        item = [[UIBarButtonItem new] initWithCustomView:[UIView new]];
        return item;
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    if (selector) {
        [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    float leight = icon.size.width;
    [btn setImage:icon forState:UIControlStateNormal];
    [btn setImage:icon forState:UIControlStateHighlighted];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    [btn setFrame:CGRectMake(0, 0, leight, 30)];
    
    item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

- (UIBarButtonItem *)ittemRightItemWithTitle:(NSString *)title selector:(SEL)selector {
    UIBarButtonItem *item;
    if (title.length == 0) {
        item = [[UIBarButtonItem new] initWithCustomView:[UIView new]];
        return item;
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    if (selector) {
        [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
//    [btn setTitleColor:kCSMLOGOBrownColor forState:UIControlStateNormal];
//    [btn setTitleColor:kCSMLOGOBrownColor forState:UIControlStateHighlighted];
//    CGSize titleSize = [title ex_sizeWithFont:btn.titleLabel.font constrainedToSize:CGSizeMake(kScreenW, MAXFLOAT)];
//    float leight = titleSize.width;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

#pragma mark - Action

- (void)backAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 懒加载

- (CGRect)StatusRect {
    return [[UIApplication sharedApplication] statusBarFrame];
}

- (CGRect)NavRect {
    CGRect naviR = self.navigationController.navigationBar.frame;
    if (self.navigationController.navigationBar.frame.origin.y > 0) {
        
    }else if (kDevice_Is_iPhoneX) {
        naviR.origin.y = 44;
    }else {
        naviR.origin.y = 20;
    }
    return naviR;
}

- (CGFloat)NaviBottom {
    CGFloat NavRectH;
    if (self.NavRect.size.height > 0) {
        NavRectH = self.NavRect.size.height;
    }else {
        NavRectH = 44;
    }
    return self.NavRect.origin.y + NavRectH;
}

//- (UIButton *)backBtn {
//    if (!_backBtn) {
//        _backBtn = [UIButton commonBtnWithType:(UIButtonTypeCustom)
//                                         Frame:CGRectMake(kImgFit(10), self.NavRect.origin.y+kImgFit(5), kImg(120), kImg(120))
//                                          text:nil
//                                        TColor:nil
//                                          font:nil
//                                          NImg:[UIImage imageNamed:@"back_icon.png"]
//                                          SImg:nil
//                                         BNImg:nil
//                                         BSImg:nil
//                                         color:nil];
//        [_backBtn addTarget:self action:@selector(backAction:) forControlEvents:(UIControlEventTouchUpInside)];
//        _backBtn.imageEdgeInsets = UIEdgeInsetsMake(kImgFit(30), kImgFit(50), kImgFit(30), kImgFit(50));
//    }
//    return _backBtn;
//}

- (void)initBackBtnWithBG {
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(kImgFit(38), self.NavRect.origin.y + kImg(32), kImg(120), kImg(120))];
//    view.backgroundColor = [UIColor whiteColor];
//    view.alpha = 0.5;
//    view.layer.cornerRadius = view.width/2;
//    self.backBtn.centerX = view.width/2;
//    self.backBtn.centerY = view.height/2;
//    [view addSubview:self.backBtn];
//    [self.view addSubview:view];
}

//- (MJRefreshNormalHeader *)setRefreshNormalHeaderParameter:(MJRefreshNormalHeader *)header {
//    header.lastUpdatedTimeLabel.hidden = YES;
//
//    [header setTitle:@"下拉可以刷新" forState:MJRefreshStateIdle];
//    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
//    [header setTitle:@"正在刷新数据中..." forState:MJRefreshStateRefreshing];
//    return header;
//}
//
//- (MJRefreshBackNormalFooter *)setRefreshBackNormalFooterParameter:(MJRefreshBackNormalFooter *)footer {
//    [footer setTitle:NSLocalizedStringFromTable(@"MJRefreshBackFooterIdleText", @"MJRefresh",@"上拉可以加载更多") forState:MJRefreshStateIdle];
//    [footer setTitle:NSLocalizedStringFromTable(@"MJRefreshBackFooterPullingText", @"MJRefresh",@"松开立即加载更多") forState:MJRefreshStatePulling];
//    [footer setTitle:NSLocalizedStringFromTable(@"MJRefreshBackFooterRefreshingText", @"MJRefresh",@"正在加载更多的数据...") forState:MJRefreshStateRefreshing];
//    [footer setTitle:NSLocalizedStringFromTable(@"MJRefreshBackFooterNoMoreDataText", @"MJRefresh",@"已经全部加载完毕") forState:MJRefreshStateNoMoreData];
//    return footer;
//}
//
//- (MJRefreshAutoNormalFooter *)setRefreshAutoNormalFooterParameter:(MJRefreshAutoNormalFooter *)footer {
//    //[footer setTitle:NSLocalizedStringFromTable(@"MJRefreshAutoFooterIdleText", @"MJRefresh",@"点击或上拉加载更多") forState:MJRefreshStateIdle];
//    //[footer setTitle:NSLocalizedStringFromTable(@"MJRefreshAutoFooterRefreshingText", @"MJRefresh",@"正在加载更多的数据...") forState:MJRefreshStateRefreshing];
//    //[footer setTitle:NSLocalizedStringFromTable(@"MJRefreshAutoFooterNoMoreDataText", @"MJRefresh",@"已经全部加载完毕") forState:MJRefreshStateNoMoreData];
//    return footer;
//}

#pragma mark - network

- (void)refreshInfo {
    
}


@end
