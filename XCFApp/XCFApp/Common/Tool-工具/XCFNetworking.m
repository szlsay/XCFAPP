//
//  XCFNetworking.m
//  XCFApp
//
//  Created by rkxt_ios on 16/1/4.
//  Copyright © 2016年 ST. All rights reserved.
//

#import "XCFNetworking.h"

static NSString *xcf_privateNetworkBaseUrl = nil;
static BOOL xcf_isEnableInterfaceDebug = NO;
static BOOL xcf_shouldAutoEncode = YES;
static NSDictionary *xcf_httpHeaders = nil;
static XCFResponseType xcf_responseType = XCFResponseTypeJSON;
static XCFRequestType  xcf_requestType  = XCFRequestTypeJSON;

@implementation XCFNetworking

+ (void)updateBaseUrl:(NSString *)baseUrl {
    xcf_privateNetworkBaseUrl = baseUrl;
}

+ (NSString *)baseUrl {
    return xcf_privateNetworkBaseUrl;
}

+ (void)enableInterfaceDebug:(BOOL)isDebug {
    xcf_isEnableInterfaceDebug = isDebug;
}

+ (BOOL)isDebug {
    return xcf_isEnableInterfaceDebug;
}

+ (void)configResponseType:(XCFResponseType)responseType {
    xcf_responseType = responseType;
}

+ (void)configRequestType:(XCFRequestType)requestType {
    xcf_requestType = requestType;
}

+ (void)shouldAutoEncodeUrl:(BOOL)shouldAutoEncode {
    xcf_shouldAutoEncode = shouldAutoEncode;
}

+ (BOOL)shouldEncode {
    return xcf_shouldAutoEncode;
}

+ (void)configCommonHttpHeaders:(NSDictionary *)httpHeaders {
    xcf_httpHeaders = httpHeaders;
}

+ (XCFRequestOperation *)getWithUrl:(NSString *)url
                            success:(XCFResponseSuccess)success
                               fail:(XCFResponseFail)fail {
    return [self getWithUrl:url params:nil success:success fail:fail];
}

+ (XCFRequestOperation *)getWithUrl:(NSString *)url
                             params:(NSDictionary *)params
                            success:(XCFResponseSuccess)success
                               fail:(XCFResponseFail)fail {
    AFHTTPRequestOperationManager *manager = [self manager];
    
    if ([self shouldEncode]) {
        url = [self encodeUrl:url];
    }
    
    AFHTTPRequestOperation *op = [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self successResponse:responseObject callback:success];
        
        if ([self isDebug]) {
            [self logWithSuccessResponse:responseObject url:operation.response.URL.absoluteString params:params];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (fail) {
            fail(error);
        }
        
        if ([self isDebug]) {
            [self logWithFailError:error url:operation.response.URL.absoluteString params:params];
        }
    }];
    
    return op;
}

+ (XCFRequestOperation *)postWithUrl:(NSString *)url
                              params:(NSDictionary *)params
                             success:(XCFResponseSuccess)success
                                fail:(XCFResponseFail)fail {
    if ([self shouldEncode]) {
        url = [self encodeUrl:url];
    }
    
    AFHTTPRequestOperationManager *manager = [self manager];
    AFHTTPRequestOperation *op = [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self successResponse:responseObject callback:success];
        
        if ([self isDebug]) {
            [self logWithSuccessResponse:responseObject url:operation.response.URL.absoluteString params:params];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (fail) {
            fail(error);
        }
        
        if ([self isDebug]) {
            [self logWithFailError:error url:operation.response.URL.absoluteString params:params];
        }
    }];
    
    return op;
}

+ (XCFRequestOperation *)uploadWithImage:(UIImage *)image
                                     url:(NSString *)url
                                filename:(NSString *)filename
                                    name:(NSString *)name
                                 success:(XCFResponseSuccess)success
                                    fail:(XCFResponseFail)fail {
    if ([self shouldEncode]) {
        url = [self encodeUrl:url];
    }
    
    AFHTTPRequestOperationManager *manager = [self manager];
    AFHTTPRequestOperation *op = [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        
        NSString *imageFileName = filename;
        if (filename == nil || ![filename isKindOfClass:[NSString class]] || filename.length == 0) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            imageFileName = [NSString stringWithFormat:@"%@.jpg", str];
        }
        
        // 上传图片，以文件流的格式
        [formData appendPartWithFileData:imageData name:name fileName:imageFileName mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self successResponse:responseObject callback:success];
        
        if ([self isDebug]) {
            [self logWithSuccessResponse:responseObject url:operation.response.URL.absoluteString params:nil];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (fail) {
            fail(error);
        }
        
        if ([self isDebug]) {
            [self logWithFailError:error url:operation.response.URL.absoluteString params:nil];
        }
    }];
    
    return op;
}

#pragma mark - Private
+ (AFHTTPRequestOperationManager *)manager {
    // 开启转圈圈
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    AFHTTPRequestOperationManager *manager = nil;;
    if ([self baseUrl] != nil) {
        manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:[self baseUrl]]];
    } else {
        manager = [AFHTTPRequestOperationManager manager];
    }
    
    switch (xcf_requestType) {
        case XCFRequestTypeJSON: {
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        }
        case XCFRequestTypePlainText: {
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            break;
        }
        default: {
            break;
        }
    }
    
    switch (xcf_responseType) {
        case XCFResponseTypeJSON: {
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        }
        case XCFResponseTypeXML: {
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        }
        case XCFResponseTypeData: {
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        }
        default: {
            break;
        }
    }
    
    manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    for (NSString *key in xcf_httpHeaders.allKeys) {
        if (xcf_httpHeaders[key] != nil) {
            [manager.requestSerializer setValue:xcf_httpHeaders[key] forHTTPHeaderField:key];
        }
    }
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
    
    // 设置允许同时最大并发数量，过大容易出问题
    manager.operationQueue.maxConcurrentOperationCount = 3;
    return manager;
}

+ (void)logWithSuccessResponse:(id)response url:(NSString *)url params:(NSDictionary *)params {
    
    XCFLog(@"\nabsoluteUrl: %@\n params:%@\n response:%@\n\n",
           url,
           params,
           [self tryToParseData:response]);
}

+ (void)logWithFailError:(NSError *)error url:(NSString *)url params:(NSDictionary *)params {
    XCFLog(@"\nabsoluteUrl: %@\n params:%@\n errorInfos:%@\n\n",
           url,
           params,
           [error localizedDescription]);
}

+ (NSString *)encodeUrl:(NSString *)url {
    return [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (id)tryToParseData:(id)responseData {
    if ([responseData isKindOfClass:[NSData class]]) {
        // 尝试解析成JSON
        if (responseData == nil) {
            return responseData;
        } else {
            NSError *error = nil;
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseData
                                                                     options:NSJSONReadingMutableContainers
                                                                       error:&error];
            
            if (error != nil) {
                return responseData;
            } else {
                return response;
            }
        }
    } else {
        return responseData;
    }
}

+ (void)successResponse:(id)responseData callback:(XCFResponseSuccess)success {
    if (success) {
        success([self tryToParseData:responseData]);
    }
}

@end

