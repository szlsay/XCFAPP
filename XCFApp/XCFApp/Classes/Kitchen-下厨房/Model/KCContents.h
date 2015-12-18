//
//  KCContents.h
//  travelInter
//
//  Created by rkxt_ios on 15/12/10
//  Copyright (c) leowu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCImage, KCAuthor;

@interface KCContents : NSObject

@property (nonatomic, copy) NSString *title_1st;
@property (nonatomic, strong) KCImage *image;
@property (nonatomic, copy) NSString *title_2nd;
@property (nonatomic, copy) NSString *whisper;
@property (nonatomic, assign) double nDishes;
@property (nonatomic, strong) KCAuthor *author;
@property (nonatomic, assign) double n_cooked;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *recipeId;
@property (nonatomic, copy) NSString *videoUrl;
@property (nonatomic, copy) NSString *score;

@end