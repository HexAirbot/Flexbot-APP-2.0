//
//  NSDictionary+Log.m
//  TianAnRenShou
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"{/n"];
    
    // 遍历字典的所有键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [str appendFormat:@"/t%@ = %@,/n",key,obj];
    }];
    
    // 查出最后一个,的范围
    [str appendString:@"}"];
    
    
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length)
    {
        // 查出最后一个,的范围
        [str deleteCharactersInRange:range];
    }
    return str;
}


@end
