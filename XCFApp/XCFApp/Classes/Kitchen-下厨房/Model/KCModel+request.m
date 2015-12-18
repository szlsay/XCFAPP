//
//  KCModel+request.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/8.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCModel+request.h"

#import "KCContent.h"

static NSString * const urlKC = @"http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=a9874058dcb8dc97659aaf33e812be22&sk=w6wLf9JUTDysdvaxDKoVJA&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";


@implementation KCModel (request)
+ (void)requestWithCompletionBlock:(CompletionBlock)successBlock
                      failureBlock:(FailureBlock)failureBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlKC
      parameters:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
             
        KCModel *model = [KCModel objectWithKeyValues:responseObject];
        
        if ([model.status isEqualToString:@"ok"]) {
            successBlock(model.content.issues);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

@end

