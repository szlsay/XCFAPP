//
//  XCFNoDataView.h
//  XCFApp
//
//  Created by rkxt_ios on 16/1/4.
//  Copyright © 2016年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCFNoDataView;

typedef void (^RetureNodataBlock)(XCFNoDataView *_Nullable nodataView);

@interface XCFNoDataView : UIView

@property (nonatomic, copy, nullable)RetureNodataBlock block; //

- (void)showWithSuperView:(UIView *_Nullable)superView
               returnDate:(RetureNodataBlock _Nullable)block;

+ (void)remove;

@end
