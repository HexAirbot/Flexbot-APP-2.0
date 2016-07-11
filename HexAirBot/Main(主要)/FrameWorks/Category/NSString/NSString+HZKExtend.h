//
//  NSString+HZKExtend.h
//  NewBasicFrameWork
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HZKExtend)
/**
 *  将自己翻转输出
 *
 *  @return 翻转后的String
 */
- (NSString *)overturnString;


/**
 *  解码规则：将Secret字符串反序后，按照规则（A-J）-> （0-9）替换。
 例如：通过接口（GetSecret）获取到Secret：ABCDEFGHI
 解码步骤：ABCDEFGHI -> IHGFEDCBA -> 876543210
 解码后的Secret：876543210
 *
 *  @return 解码过后的字符串
 */
- (NSString *)decodeString;
@end
