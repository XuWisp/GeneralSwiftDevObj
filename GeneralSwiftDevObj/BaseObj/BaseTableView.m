//
//  BaseTableView.m
//  CASAMIEL
//
//  Created by 徐沙洪 on 2018/3/12.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

#pragma mark - Lazy load

- (NSArray *)cellDataArr {
    if (!_cellDataArr) {
        _cellDataArr = [NSArray new];
    }
    return _cellDataArr;
}

- (NSMutableArray *)cellDataMArr {
    if (!_cellDataMArr) {
        _cellDataMArr = [NSMutableArray new];
    }
    return _cellDataMArr;
}

@end
