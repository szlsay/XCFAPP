//
//  KC+request.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/8.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KC+request.h"

#import "KCContent.h"

static NSString * const urlKC = @"http://api.xiachufang.com/v2/issues/list.json?cursor=2015-12-05&origin=iphone&api_sign=c8c2def22217cc4b0df6eb39b0ee122b&sk=w6wLf9JUTDysdvaxDKoVJA&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";


@implementation KC (request)
+ (void)requestWithCompletionBlock:(CompletionBlock)successBlock
                      failureBlock:(FailureBlock)failureBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlKC parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        KC *model = [KC objectWithKeyValues:responseObject];
        
        if ([model.status isEqualToString:@"ok"]) {
            successBlock(model.content.issues);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

@end

