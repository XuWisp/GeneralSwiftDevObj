//
//  BaseTableViewCell.h
//  CASAMIEL
//
//  Created by 徐沙洪 on 2018/4/28.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

- (void)setDataWithDic:(NSDictionary *)dic;
- (void)setDataWithModel:(id)data;

@end
