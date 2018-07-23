//
//  BaseTableViewCell.m
//  CASAMIEL
//
//  Created by 徐沙洪 on 2018/4/28.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataWithDic:(NSDictionary *)dic {
    
}

- (void)setDataWithModel:(id)data {
    
}

@end
