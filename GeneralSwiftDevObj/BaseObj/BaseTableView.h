//
//  BaseTableView.h
//  CASAMIEL
//
//  Created by 徐沙洪 on 2018/3/12.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableView : UITableView

{
    NSArray *_cellDataArr;
}

@property (nonatomic, copy) NSArray *cellDataArr;
@property (nonatomic, copy) NSMutableArray *cellDataMArr;



@end
