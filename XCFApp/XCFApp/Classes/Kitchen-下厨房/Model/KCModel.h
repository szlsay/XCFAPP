//
//  KCModel.h
//  travelInter
//
//  Created by rkxt_ios on 15/12/10
//  Copyright (c) leowu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCContent,KCCursor,KCIssues,KCItems,KCContents,KCImage;

@interface KCModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) KCContent *content;

@end