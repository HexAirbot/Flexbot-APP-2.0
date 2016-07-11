//
//  NSArray+Log.m
//  在ImageView中添加按钮以及Tag的参数说明
//
//  Created by 尘埃 on 15/3/6.
//  Copyright (c) 2015年 sdzy. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)
/**
 *  如果要在开发时，跟踪对象的明细信息，可以重写description方法，类似于java的toString()
 
 为根类添加一个扩展
 */
- (NSString *)descriptionWithLocale:(id)locale
{
    // 遍历数组中的所有内容，将内容拼接成一个新的字符串返回
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:@"(\n"];

    // 遍历数组,self就是当前的数组
    for (id obj in self)
    {
        // 在拼接字符串时，会调用obj的description方法
        [strM appendFormat:@"\t%@,\n",obj];

    }
    [strM appendString:@")"];
    
    return strM;
}


@end
