//
//  RegularExpression.h
//  TianAnRenShou
//
//  Created by han on 15/4/14.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularExpression : NSObject

/**
 *  验证数字
 *
 *  @param birthday 生日
 *
 *  @return 验证结果
 */
+ (BOOL)validateBirthday:(NSString *)birthday;
/**
 *  验证手机号码
 *
 *  @param mobile 手机号
 *
 *  @return 验证结果
 */
+ (BOOL)validateMobile:(NSString *)mobile;
/**
 *  验证密码
 *
 *  @param passWord 密码
 *
 *  @return 验证结果
 */
+ (BOOL)validatePassword:(NSString *)passWord;
/**
 *  验证昵称
 *
 *  @param nickname 可带汉子的名字
 *
 *  @return 验证结果
 */
+ (BOOL)validateNickname:(NSString *)nickname;
/**
 *  验证身份证号
 *
 *  @param identityCard 身份证号码
 *
 *  @return 验证结果
 */
+ (BOOL)validateIdentityCard:(NSString *)identityCard;
/**
 *  验证emile
 *
 *  @param emile emile
 *
 *  @return 验证结果
 */
+ (BOOL)validateEmile:(NSString *)emile;
/**
 *  验证邮编
 *
 *  @param postCode 邮编
 *
 *  @return 验证结果
 */
+ (BOOL)validatePostCode:(NSString *)postCode;

/**
 *  验证验证码
 *
 *  @param code 验证码
 *
 *  @return 验证结果
 */
+ (BOOL)validateCode:(NSString *)code;

/**
 *  验证生日和身份证号
 *
 *  @param birthday  生日
 *  @param identityCard 身份证号
 *
 *  @return 验证结果
 */
+ (BOOL)validateBirthday:(NSString *)birthday andIdentityCard:(NSString *)identityCard;
/**
 *  验证是否为空字符
 *
 *  @param string 待验证的字符
 *
 *  @return 验证结果
 */
+ (BOOL)validateIsBlankString:(NSString *)string;





//------------------------------验证且提示-----------------


/**
 *  验证密码并且提示
 *
 *  @param oldPassWord 原密码
 *  @param newPassWord 新密码
 *
 *  @return 验证结果
 */
+ (BOOL)validateOldPassword:(NSString *)oldPassWord andNewPassWord:(NSString *)newPassWord;

/**
 *  验证验证码并且提示
 *
 *  @param code 验证码
 *
 *  @return 验证结果
 */
+ (BOOL)validateCodeAndHint:(NSString *)code;


/**
 *  验证登录并且提示
 *
 *  @param userName 用户名
 *  @param pwd      用户密码
 *
 *  @return 验证结果
 */
+ (BOOL)validateUserTel:(NSString *)userTel andPwd:(NSString *)pwd;

/**
 *  验证手机号码并且提示
 *
 *  @param mobile 手机号
 *
 *  @return 验证结果
 */
+ (BOOL)validateMobileAndHint:(NSString *)mobile;


@end
