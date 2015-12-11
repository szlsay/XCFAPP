//
//  KCTouchController.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/11.
//  Copyright © 2015年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KCItems;
@protocol KCTouchControllerDelegate<NSObject>

- (void)touchControllerItems:(KCItems * _Nullable)items;

@end
@interface KCTouchController : UIViewController

@property (nonatomic, strong, nullable)KCItems *items; //
@property ( nonatomic, weak, nullable) id <KCTouchControllerDelegate>delegate; //
@end
