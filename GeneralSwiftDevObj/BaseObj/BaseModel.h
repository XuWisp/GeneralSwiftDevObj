//
//  BaseModel.h
//  CASAMIEL
//
//  Created by 徐沙洪 on 2017/12/18.
//  Copyright © 2017年 徐沙洪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>

@interface BaseModel : NSObject <NSCoding>

/**
 1.简单的字典 --> 模型
 核心代码 mj_objectWithKeyValues:
 
 2. JSON字符串 --> 模型
 核心代码 mj_objectWithKeyValues:
 
 3. 复杂的字典 --> 模型 (模型里面包含了模型)
 核心代码 mj_objectWithKeyValues:
 
 4.模型中有个数组属性，数组里面又要装着其它模型
 核心代码 mj_objectWithKeyValues:和mj_objectClassInArray
 
 5.模型中的属性名和字典中的key不相同(或者需要多级映射)
 核心代码 mj_objectWithKeyValues: 和 mj_replacedKeyFromPropertyName
 >//多级映射，用点语法设置
 
 6.将一个字典数组转成模型数组
 核心代码 mj_objectArrayWithKeyValuesArray
 
 7. 将一个模型转成字典
 核心代码 mj_keyValues
 
 8. 将一个模型数组转成字典数组
 核心代码 mj_keyValuesArrayWithObjectArray
 */

@end
