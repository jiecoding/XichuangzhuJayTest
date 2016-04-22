//
//  XCZQuoteView.m
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/22.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "XCZQuoteView.h"
#import <Masonry.h>
#import "Constants.h"
@implementation XCZQuoteView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    [self createSubViews];
    
    return self;
    
}

- (void)createSubViews
{
    UIImageView *logoView = [UIImageView new];
    logoView.image = [UIImage imageNamed:@"AppIcon40x40"];
    [self addSubview:logoView];
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo([NSNumber numberWithFloat:[self logoWidth]]);
        make.left.equalTo(self).offset([self logoHorizonalGap]);
        make.bottom.equalTo(self).offset(-[self logoVerticalGap]);
    }];
    
 

    UILabel *authorLabel = [UILabel new];
    NSString *text = @"李\n白";
    authorLabel.numberOfLines = text.length;
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];

    paragraphStyle.lineSpacing = 2;
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:text attributes:@{NSParagraphStyleAttributeName: paragraphStyle}];
    
    authorLabel.attributedText = attributedString;
    
    [self addSubview:authorLabel];
    
    [authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //offset masonry的offset 偏移量 两个控件之间的距离
        make.bottom.equalTo(logoView.mas_top).offset(-10);
        make.centerX.equalTo(logoView);
    }];
    
    
    
    
}

- (CGFloat)logoWidth
{
    if(IS_IPHONE_4_OR_LESS)
    {
        return 17;
    } else if (IS_IPHONE_5)
    {
        return 18;
    }
    else if (IS_IPHONE_6)
    {
        return 20;
    }
    else
    {
        return 22;
    }
    
}

- (CGFloat)logoVerticalGap
{
    if (IS_IPHONE_4_OR_LESS) {
        return 20;
    } else if (IS_IPHONE_5) {
        return 20;
    } else if (IS_IPHONE_6) {
        return 23;
    } else {
        return 26;
    }
}


- (CGFloat)logoHorizonalGap
{
    if (IS_IPHONE_4_OR_LESS) {
        return 15;
    } else if (IS_IPHONE_5) {
        return 15;
    } else if (IS_IPHONE_6) {
        return 17;
    } else {
        return 19;
    }
}

@end
