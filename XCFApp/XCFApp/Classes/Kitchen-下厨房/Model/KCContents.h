//
//  KCContents.h
//  travelInter
//
//  Created by rkxt_ios on 15/12/10
//  Copyright (c) leowu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCImage;

@interface KCContents : NSObject

@property (nonatomic, copy) NSString *title_1st;

@property (nonatomic, strong) KCImage *image;

@property (nonatomic, copy) NSString *title_2nd;

//@property (nonatomic, strong) NSString *whisper;
//@property (nonatomic, assign) double nDishes;
//@property (nonatomic, strong) KCAuthor *author;
//@property (nonatomic, assign) double nCooked;
//@property (nonatomic, strong) NSString *desc;
//@property (nonatomic, strong) NSString *title;
//@property (nonatomic, strong) NSString *recipeId;
//@property (nonatomic, strong) NSString *videoUrl;
//@property (nonatomic, strong) KCImage *image;
//@property (nonatomic, strong) NSString *title2nd;
//@property (nonatomic, strong) NSString *title1st;
//@property (nonatomic, strong) NSString *score;

@end