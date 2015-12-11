//
//  KCModel+request.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/8.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCModel.h"
typedef void(^CompletionBlock)(id returnValue);
typedef void(^FailureBlock)(NSError *error);
@interface KCModel (request)
+ (void)requestWithCompletionBlock:(CompletionBlock)successBlock
                      failureBlock:(FailureBlock)failureBlock;
@end
