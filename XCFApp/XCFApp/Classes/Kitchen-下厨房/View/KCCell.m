//
//  KCCell.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/9.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCCell.h"
#import "KCItems.h"
#import "KCContents.h"
#import "KCImage.h"
@interface KCCell()
@property (nonatomic, strong, nullable)UILabel *labelTitle; //
@property (nonatomic, strong, nullable)UIImageView *pictureView; //
@end

@implementation KCCell

- (void)setupUI
{
    [super setupUI];
    
    [self.contentView addSubview:self.labelTitle];
    [self.contentView addSubview:self.pictureView];
}


- (void)setItems:(KCItems *)items
{
    _items = items;
    
    NSLog(@"%s, %@", __FUNCTION__, items.contents);
    
    self.labelTitle.text = items.contents.title_1st;
    
    self.pictureView.yy_imageURL = [NSURL URLWithString:items.contents.image.url];
}

- (UILabel *)labelTitle
{
    if (!_labelTitle) {
        _labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
        [_labelTitle setText:@"1234567"];
    }
    return _labelTitle;
}

- (UIImageView *)pictureView
{
    if (!_pictureView) {
        _pictureView = [[UIImageView alloc]initWithFrame:CGRectMake(0,
                                                                    0,
                                                                    ScreenWidth,
                                                                    400)];
    }
    return _pictureView;
}

@end
