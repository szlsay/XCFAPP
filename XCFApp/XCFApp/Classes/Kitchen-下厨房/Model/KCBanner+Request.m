//
//  KCBanner+Request.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/19.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCBanner+Request.h"
static NSString *const urlKCBanner = @"http://api.xiachufang.com/v2/init_page_v5.json?timezone=Asia%2FShanghai&api_sign=65033093fc36d99e4fb35c7a75e496e1&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&version=5.1.1";
@implementation KCBanner (Request)
+ (void)requestWithCompletionBlock:(CompletionBlock)successBlock
                      failureBlock:(FailureBlock)failureBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlKCBanner
      parameters:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
             KCBanner *model = [KCBanner objectWithKeyValues:responseObject];
             if ([model.status isEqualToString:@"ok"]) {
                 successBlock(model.content);
             }
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             failureBlock(error);
         }];
}
@end
