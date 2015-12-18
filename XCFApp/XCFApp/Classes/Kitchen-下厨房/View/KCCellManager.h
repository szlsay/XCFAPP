//
//  KCCellManager.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/17.
//  Copyright © 2015年 ST. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KCItems;
@interface KCCellManager : NSObject
@property (nonatomic, strong, nullable)KCItems *items; //

@property (nonatomic, readonly, assign)CGRect framePicture; //
@property (nonatomic, readonly, assign)CGRect frameTitle; //
@property (nonatomic, readonly, assign)CGRect frameDesc;
@property (nonatomic, readonly, assign)CGRect frameCook;
@property (nonatomic, readonly, assign)CGFloat heightCell; //
@end
