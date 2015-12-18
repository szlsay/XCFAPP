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
#import "KCAuthor.h"

#import "KCCellManager.h"

static const CGFloat WeightIcon = 50;

@interface KCCell()

@property (nonatomic, strong, nullable)UIImageView  *pictureView; //
@property (nonatomic, strong, nullable)UILabel      *labelTitle1; //
@property (nonatomic, strong, nullable)UILabel      *labelTitle2; //
@property (nonatomic, strong, nullable)UIImageView  *iconView;    //
@property (nonatomic, strong, nullable)UILabel      *labelTitle;  //
@property (nonatomic, strong, nullable)UILabel      *labelDesc;   //
@property (nonatomic, strong, nullable)UILabel      *labelCook;   //
@property (nonatomic, strong, nullable)CALayer      *pictureLayer; //
@end

@implementation KCCell

- (void)setupUI
{
    [super setupUI];
    
    [self.contentView addSubview:self.pictureView];
    [self.pictureView addSubview:self.labelTitle1];
    [self.pictureView addSubview:self.labelTitle2];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.labelTitle];
    [self.contentView addSubview:self.labelDesc];
    [self.contentView addSubview:self.labelCook];
    
}


- (void)setManager:(KCCellManager *)manager
{
    _manager = manager;
    
    KCItems *items = manager.items;
    
    self.pictureView.yy_imageURL = [NSURL URLWithString:items.contents.image.url];
    self.labelTitle1.text        = items.contents.title_1st;
    self.labelTitle2.text        = items.contents.title_2nd;
    self.iconView.yy_imageURL    = [NSURL URLWithString:items.contents.author.photo];
    
    
    NSMutableParagraphStyle *styleParagraph=[NSMutableParagraphStyle new];
    styleParagraph.alignment     = NSTextAlignmentLeft;
    styleParagraph.lineSpacing   = 3;
    styleParagraph.lineBreakMode = NSLineBreakByTruncatingTail;
    
    NSDictionary * attributesDict=@{NSFontAttributeName:[UIFont systemFontOfSize:12],
                                    NSForegroundColorAttributeName:[XCFColor colorTextNormal],
                                    NSParagraphStyleAttributeName:styleParagraph};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithRequestString:items.contents.desc defaultString:@""]
                                                                                        attributes:attributesDict] ;
    self.labelTitle.text         = items.contents.title;
    self.labelDesc.attributedText= attributedString;
    self.labelCook.text          = [NSString stringWithFormat:@"%g人做过", items.contents.n_cooked];
    
    
    self.pictureView.frame  = manager.framePicture;
    self.pictureLayer.frame = self.pictureView.bounds;
    
    CGSize title1Size = [items.contents.title_1st sizeWithFont:21
                                                      maxWidth:self.labelTitle1.width
                                                     maxHeight:ScreenHeight];
    self.labelTitle1.height  = title1Size.height;
    self.labelTitle1.centerX = self.pictureView.centerX;
    self.labelTitle1.centerY = self.pictureView.centerY - XCFMarginBig;
    
    self.labelTitle2.y       = CGRectGetMaxY(self.labelTitle1.frame) + XCFMarginSmall;
    self.labelTitle2.centerX = self.pictureView.centerX;
    
    
    self.iconView.centerX    = self.pictureView.width - self.iconView.width/2 - XCFMargin;
    self.iconView.centerY    = self.pictureView.height;
    
    self.labelTitle.frame = manager.frameTitle;
    self.labelDesc.frame  = manager.frameDesc;
    self.labelCook.frame  = manager.frameCook;
    
    NSLog(@"%s, %ld", __FUNCTION__, (long)items.template);
    switch (items.template) {
        case 5:
            [self.iconView setHidden:NO];
            [self.labelCook setHidden:NO];
            break;
        default:
            [self.iconView setHidden:YES];
            [self.labelCook setHidden:YES];
            break;
    }
}

- (UILabel *)labelTitle1
{
    if (!_labelTitle1) {
        _labelTitle1 = [UILabel labelWithFrame:CGRectMake(0,
                                                          0,
                                                          ScreenWidth-XCFControlSystemHeight,
                                                          XCFControlSystemHeight)
                                          text:@""
                                          size:21
                                         color:[UIColor whiteColor]
                                     alignment:NSTextAlignmentCenter
                                         lines:0];
        [_labelTitle1 setFont:[UIFont boldSystemFontOfSize:21]];
    }
    return _labelTitle1;
}

- (UILabel *)labelTitle2
{
    if (!_labelTitle2) {
        _labelTitle2 = [UILabel labelWithFrame:CGRectMake(0,
                                                          0,
                                                          ScreenWidth-XCFControlSystemHeight,
                                                          XCFControlSystemHeight)
                                          text:@""
                                          size:17
                                         color:[UIColor whiteColor]
                                     alignment:NSTextAlignmentCenter
                                         lines:0];
    }
    return _labelTitle2;
}

- (UIImageView *)pictureView
{
    if (!_pictureView) {
        _pictureView = [[UIImageView alloc]initWithFrame:CGRectMake(0,
                                                                    0,
                                                                    ScreenWidth,
                                                                    0)];
        [_pictureView setContentMode:UIViewContentModeScaleAspectFill];
        [_pictureView.layer setMasksToBounds:YES];
        [_pictureView.layer addSublayer:self.pictureLayer];
    }
    return _pictureView;
}

- (UIImageView *)iconView
{
    if (!_iconView) {
        _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0,
                                                                 0,
                                                                 WeightIcon,
                                                                 WeightIcon)];
        [_iconView.layer setCornerRadius:WeightIcon/2];
        [_iconView.layer setMasksToBounds:YES];
        [_iconView.layer setBorderColor:[UIColor whiteColor].CGColor];
        [_iconView.layer setBorderWidth:1];
    }
    return _iconView;
}

- (UILabel *)labelTitle
{
    if (!_labelTitle) {
        _labelTitle = [UILabel labelWithFrame:CGRectZero
                                         text:@""
                                         size:17
                                        color:[XCFColor colorTextNormal]
                                    alignment:NSTextAlignmentLeft
                                        lines:0];
    }
    return _labelTitle;
}

- (UILabel *)labelDesc
{
    if (!_labelDesc) {
        _labelDesc = [UILabel labelWithFrame:CGRectZero
                                        text:@""
                                        size:12
                                       color:[XCFColor colorTextNormal]
                                   alignment:NSTextAlignmentLeft
                                       lines:0];
    }
    return _labelDesc;
}

- (UILabel *)labelCook
{
    if (!_labelCook) {
        _labelCook = [UILabel labelWithFrame:CGRectZero
                                        text:@""
                                        size:13
                                       color:[XCFColor colorRedText]
                                   alignment:NSTextAlignmentRight];
    }
    return _labelCook;
}

- (CALayer *)pictureLayer
{
    if (!_pictureLayer) {
        _pictureLayer = [[CALayer alloc]init];
        [_pictureLayer setBackgroundColor:[XCFColor colorLayerPicture].CGColor];
    }
    return _pictureLayer;
}
@end
