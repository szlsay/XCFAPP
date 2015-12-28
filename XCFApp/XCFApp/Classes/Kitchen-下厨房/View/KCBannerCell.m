//
//  KCBannerCell.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/21.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCBannerCell.h"

#import "KCBannerContent.h"
#import "KCBannerNavs.h"
@interface KCBannerCell()

@end

@implementation KCBannerCell

- (void)setupUI
{
    [super setupUI];
}

- (void)setBannerContent:(KCBannerContent *)bannerContent
{
    _bannerContent = bannerContent;
    
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat itemW = ScreenWidth / bannerContent.navs.count;
    CGFloat itemH = 80;
    CGFloat itemY = 0;
    for (int i = 0; i < bannerContent.navs.count; i++) {
        KCBannerNavs *navs = bannerContent.navs[i];
        
        CGFloat itemX = i * itemW;
        UIButton *buttonItem = [UIButton buttonWithFrame:CGRectMake(itemX, itemY, itemH, itemW)
                                         backgroundColor:[UIColor whiteColor]
                                                   title:@""
                                              titleColor:nil
                                                fontSize:11];
        LxDBAnyVar(navs.picurl);
        buttonItem.imageView.yy_imageURL = [NSURL URLWithString:navs.picurl];
        [self.contentView addSubview:buttonItem];
        
        UIImageView *imageItem = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        imageItem.centerX = buttonItem.width / 2;
        [imageItem setYy_imageURL:[NSURL URLWithString:navs.picurl]];
        [buttonItem addSubview:imageItem];
        
        UILabel *labelItem = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        
    }
}

@end
