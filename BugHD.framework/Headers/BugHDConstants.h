//
//  BugHDConstants.h
//  BugHDSDK
//
//  Created by Travis on 14-10-9.
//  Copyright (c) 2014年 Fly It Remotely International Corporation. All rights reserved.
//

#ifndef __IPHONE_5_0
#warning "This project uses features only available in iPhone SDK 5.0 and later."
#endif

#ifndef BugHDSDK_BugHDConstants_h
#define BugHDSDK_BugHDConstants_h

typedef void (^BugHDResultBlock)(id result, NSError *error);

#define BugHDDeprecated(explain) __attribute__((deprecated(explain)))
#endif

