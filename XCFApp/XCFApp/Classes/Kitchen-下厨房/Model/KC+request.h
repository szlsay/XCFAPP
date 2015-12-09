//
//  KC+request.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/8.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KC.h"
typedef void(^CompletionBlock)(id returnValue);
typedef void(^FailureBlock)(NSError *error);
@interface KC (request)
+ (void)requestWithCompletionBlock:(CompletionBlock)successBlock
                      failureBlock:(FailureBlock)failureBlock;
@end
