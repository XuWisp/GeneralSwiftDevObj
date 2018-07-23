//
//  BaseCollectionView.h
//  CASAMIEL
//
//  Created by 徐沙洪 on 2018/4/28.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView

{
    NSArray *_cellDataArr;
}
@property (nonatomic, copy) NSArray *cellDataArr;

@end
