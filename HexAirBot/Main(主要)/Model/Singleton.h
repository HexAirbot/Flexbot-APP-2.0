//
//  Singleton.h
//  PCH文件下单例模式（试用与ARC与MRC）
//
//  Created by 尘埃 on 15/3/17.
//  Copyright (c) 2015年 sdzy. All rights reserved.
//

#ifndef PCH___________ARC_MRC__Singleton_h
#define PCH___________ARC_MRC__Singleton_h

// ## : 连接字符串和参数
#define singleton_h(name) + (instancetype)shared##name;

#if __has_feature(objc_arc)  //如果是ARC
#define singleton_m(name) \
static id _instance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
+ (id)copyWithZone:(struct _NSZone *)zone \
{ \
return _instance; \
}

#else //非ARC
#define singleton_m(name) \
static id _instance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (oneway void)release \
{ \
\
} \
\
- (id)autorelease \
{ \
return _instance; \
} \
\
- (id)retain \
{ \
return _instance; \
} \
\
- (NSUInteger)retainCount \
{ \
return 1; \
} \
\
+ (id)copyWithZone:(struct _NSZone *)zone \
{ \
return _instance; \
}
#endif
#endif
