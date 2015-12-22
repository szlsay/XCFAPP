//
//  KCBanner+Request.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/19.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCBanner.h"

@interface KCBanner (Request)
+ (void)requestWithCompletionBlock:(CompletionBlock)successBlock
                      failureBlock:(FailureBlock)failureBlock;
@end
