//
//  BaseCollectionView.m
//  CASAMIEL
//
//  Created by 徐沙洪 on 2018/4/28.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView

#pragma mark - Lazy load

- (NSArray *)cellDataArr {
    if (!_cellDataArr) {
        _cellDataArr = [NSArray array];
    }
    return _cellDataArr;
}

@end
