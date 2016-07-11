//
//  RegularExpression.m
//  TianAnRenShou
//
//  Created by han on 15/4/14.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import "RegularExpression.h"
#import "MBProgressHUD+NJ.h"

@implementation RegularExpression
#pragma mark-验证手机号码

+ (BOOL)validateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^(1[0-9])\\d{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:mobile];

}
////+ (BOOL)validateMobile:(NSString *)mobile
////{
////    //手机号以13， 15，18开头，八个 \d 数字字符
////    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
////    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
////    return [phoneTest evaluateWithObject:mobile];
//    
//    /**
//     * 手机号码
//     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
//     * 联通：130,131,132,152,155,156,185,186
//     * 电信：133,1349,153,180,189
//     */
//    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
//    /**
//     10         * 中国移动：China Mobile
//     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
//     12         */
//    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
//    /**
//     15         * 中国联通：China Unicom
//     16         * 130,131,132,152,155,156,185,186
//     17         */
//    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
//    /**
//     20         * 中国电信：China Telecom
//     21         * 133,1349,153,180,189
//     22         */
//    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
//    /**
//     25         * 大陆地区固话及小灵通
//     26         * 区号：010,020,021,022,023,024,025,027,028,029
//     27         * 号码：七位或八位
//     28         */
//    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
//    
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//    
//    if (([regextestmobile evaluateWithObject:mobile] == YES)
//        || ([regextestcm evaluateWithObject:mobile] == YES)
//        || ([regextestct evaluateWithObject:mobile] == YES)
//        || ([regextestcu evaluateWithObject:mobile] == YES))
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
//}


#pragma mark-验证数字
+ (BOOL)validateBirthday:(NSString *)birthday
{
    NSString *passWordRegex = @"^[0-9]{8,8}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:birthday];
}

#pragma mark-验证密码
+ (BOOL)validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,16}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}


#pragma mark- 昵称
+ (BOOL)validateNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}


#pragma mark- 身份证号
+ (BOOL)validateIdentityCard:(NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
#pragma mark- 验证邮编
+ (BOOL)validatePostCode:(NSString *)postCode
{
    NSString *passWordRegex = @"^[0-9]{6,6}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:postCode];
}
#pragma mark- 验证验证码
+ (BOOL)validateCode:(NSString *)code
{
    NSString *passWordRegex = @"^[0-9]{4,4}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:code];
}

#pragma mark- 验证emile
+ (BOOL)validateEmile:(NSString *)emile
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emile];
}

#pragma mark- 验证生日和身份证号
+ (BOOL)validateBirthday:(NSString *)birthday andIdentityCard:(NSString *)identityCard
{
    if ([birthday length] < 10 || [identityCard length] < 18)
    {
        return NO;
    }
    NSString *tempStr1 = [birthday substringToIndex:4];
    NSRange range = NSMakeRange(5, 2);
    NSString *tempStr2 = [birthday substringWithRange:range];
    NSString *tempStr3 = [birthday substringFromIndex:8];
    NSMutableString *mStr = [NSMutableString string];
    [mStr appendFormat:@"%@%@%@",tempStr1, tempStr2, tempStr3];
    
    
    NSRange rangeCard = NSMakeRange(6, 8);
    NSString *birthdayCard = [identityCard substringWithRange:rangeCard];
    
    if ([mStr isEqualToString:birthdayCard])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}



#pragma mark- IOS 开发中判断字符串是否为空字符的方法
+ (BOOL)validateIsBlankString:(NSString *)string
{
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}







#pragma mark- 验证密码并且提示
+ (BOOL)validateOldPassword:(NSString *)oldPassWord andNewPassWord:(NSString *)newPassWord
{
    
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,16}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    
    BOOL oldPaw = [passWordPredicate evaluateWithObject:oldPassWord];
    BOOL newPaw = [passWordPredicate evaluateWithObject:newPassWord];
    
    if (oldPassWord.length < 6 || newPassWord.length < 6)
    {
        [MBProgressHUD showError:@"密码长度应大于6位"];
        return NO;
    }
    else if (oldPassWord.length > 16 || newPassWord.length > 16)
    {
        [MBProgressHUD showError:@"密码长度应小于16位"];
        return NO;
    }
    else if (!oldPaw || !newPaw)
    {
        [MBProgressHUD showError:@"请使用数字，字母组合密码"];
        return NO;
    }
    else if (![oldPassWord isEqualToString:newPassWord])
    {
        [MBProgressHUD showError:@"两次输入的新密码不一致，请重新输入"];
        return NO;
    }
    else
    {
        return YES;
    }
}

#pragma mark- 验证验证码并且提示
+ (BOOL)validateCodeAndHint:(NSString *)code
{
    
    NSString *passWordRegex = @"^[0-9]{4}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    BOOL resultBol = [passWordPredicate evaluateWithObject:code];
    if ([RegularExpression validateIsBlankString:code])
    {
        [MBProgressHUD showError:@"请输入验证码"];
        return NO;
    }
    else if (!resultBol)
    {
        [MBProgressHUD showError:@"验证码格式有误，请重新输入"];
        return NO;
    }
    else
    {
        return YES;
    }
}


@end
