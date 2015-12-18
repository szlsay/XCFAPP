//
//  KCCell.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/9.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "XCFCell.h"
@class KCItems;

@class KCCellManager;
@interface KCCell : XCFCell
@property (nonatomic, strong, nullable)KCItems *items; //
@property (nonatomic, strong, nullable)KCCellManager *manager; //
@end
