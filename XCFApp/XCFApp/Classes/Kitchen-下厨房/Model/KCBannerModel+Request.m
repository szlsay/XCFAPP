//
//  KCBannerModel+Request.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/19.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCBannerModel+Request.h"
static NSString *const urlKCBanner = @"http://api.xiachufang.com/v2/ad/show.json?slot_name=homepage_banner_ad1&height=348&origin=iphone&api_sign=8ac2bab7d214931fb7d3a0cf78261f83&width=1392&sk=w6wLf9JUTDysdvaxDKoVJA&supported_types=1&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
@implementation KCBannerModel (Request)
+ (void)requestWithCompletionBlock:(CompletionBlock)successBlock
                      failureBlock:(FailureBlock)failureBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlKCBanner
      parameters:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
             KCBannerModel *model = [KCBannerModel objectWithKeyValues:responseObject];
             if ([model.status isEqualToString:@"ok"]) {
                 successBlock(model.content);
             }
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             failureBlock(error);
         }];
}
@end
