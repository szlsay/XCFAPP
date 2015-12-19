//
//  XCFLog.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/19.
//  Copyright © 2015年 XCF. All rights reserved.
//

#import <Foundation/Foundation.h>

void ExtendNSLog(const char *file, int lineNumber, const char *functionName, NSString *format, ...);
void STLog(const char *functionName, NSString *format, ...);

@interface XCFLog : NSObject

/**
 *  NSLog仅在调试模式
 */
#ifdef DEBUG

#define XCFLog(args ...) STLog(__FUNCTION__, args)
#else
#define XCFLog(args ...)
#endif

/**
 *  清除日志字符串.
 *  可以用XCFLogClear宏调用它
 */
+ (void)clearLog;

/**
 *  获取日志字符串.
 *  可以用XCFLogString宏调用它
 */
+ (NSString *)logString;
@end
