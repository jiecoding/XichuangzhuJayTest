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

- (instancetype)initWithQuote:(XCZQuote *)quote
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    
    self.quote = quote;
    
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quoteViewPressed)];
    
    [self addGestureRecognizer:tapGesture];
    
    [self createSubViews];
    
    return self;
    
}

- (void)quoteViewPressed
{
    //-(BOOL) respondsToSelector: selector 用来判断是否有以某个名字命名的方法(被封装在一个selector的对象里传递)
   
//    if(self.delegate && [self.delegate respondsToSelector:@selector(quoteViewPressed:)])
//    {
//        [UIView animateWithDuration:.01 animations:^{
            self.transform = CGAffineTransformScale(CGAffineTransformIdentity, .985, .985);
//        } completion:^(BOOL finished) {
////            [UIView ];
//            
//        }];
//    
//    }
    [self.deleagte quoteViewPressed:self.quote];
    
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
  
//    NSString *text = @"李\n白";
    NSString *text = [self createVerticalString:@"李白"];
    
    authorLabel.numberOfLines = text.length;

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = 2;
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:text attributes:@{NSParagraphStyleAttributeName: paragraphStyle}];
    
    authorLabel.attributedText = attributedString;
    authorLabel.text = [self createVerticalString:self.quote.author];
    [self addSubview:authorLabel];
    
    [authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //offset masonry的offset 偏移量 两个控件之间的距离
        make.bottom.equalTo(logoView.mas_top).offset(-10);
        make.centerX.equalTo(logoView);
    }];
    
    [self createQuoteLabels];
    
    UILabel *prevLabel;
    
    for (int i = 0; i < self.quoteLabels.count; i++) {
        UILabel *label = self.quoteLabels[i];
        
        [self addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset([self quoteTopMargin]);
        }];
        
        if (i == 0) {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self).offset(-[self quoteRightMargin]);
            }];
        } else {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(prevLabel.mas_left).offset(-[self quoteHorizonalGap]);
            }];
        }
        
        prevLabel = label;
    }
    

    for(NSString *fontfamilyname in [UIFont familyNames])
    {
        NSLog(@"family:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }
    
    
}


// 水平间距
- (CGFloat)quoteHorizonalGap
{
    // 华文仿宋
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"QuoteFont"] isEqualToString:@"STFangsong"]) {
        if (IS_IPHONE_4_OR_LESS) {
            return 9;
        } else if (IS_IPHONE_5) {
            return 10;
        } else if (IS_IPHONE_6) {
            return 11;
        } else {
            return 12;
        }
    } else {
        // 文悦仿宋
        if (IS_IPHONE_4_OR_LESS) {
            return 11;
        } else if (IS_IPHONE_5) {
            return 12;
        } else if (IS_IPHONE_6) {
            return 13;
        } else {
            return 14;
        }
    }
}

/**
 *  右边距
 *
 *  @return
 */
- (CGFloat)quoteRightMargin
{
    if (IS_IPHONE_4_OR_LESS) {
        return 26;
    } else if (IS_IPHONE_5) {
        return 28;
    } else if (IS_IPHONE_6) {
        return 33;
    } else {
        return 36;
    }
}

/**
 *  上边距
 *
 *  @return
 */
- (CGFloat)quoteTopMargin
{
    if (IS_IPHONE_4_OR_LESS) {
        return 26;
    } else if (IS_IPHONE_5) {
        return 28;
    } else if (IS_IPHONE_6) {
        return 33;
    } else {
        return 36;
    }
}


- (void)createQuoteLabels
{
    [self.quoteLabels removeAllObjects];
    
    for(NSString *piece in self.quote.pieces){
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        //?
        paragraphStyle.lineSpacing =  0.6;
        
        UILabel *quoteLabel = [self createVerticalLabel:piece attributes:@{NSParagraphStyleAttributeName: paragraphStyle}];

        quoteLabel.font = [UIFont fontWithName:XCZFontHWFangsong size:[self quoteFontSize]];
        [self.quoteLabels addObject:quoteLabel];

    }

}


// 字体大小
- (CGFloat)quoteFontSize
{
    // 华文仿宋
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"QuoteFont"] isEqualToString:@"STFangsong"]) {
        if (IS_IPHONE_4_OR_LESS) {
            return 23;
        } else if (IS_IPHONE_5) {
            return 25;
        } else if (IS_IPHONE_6) {
            return 28;
        } else {
            return 31;
        }
    } else {
        // 文悦仿宋
        if (IS_IPHONE_4_OR_LESS) {
            return 19;
        } else if (IS_IPHONE_5) {
            return 21;
        } else if (IS_IPHONE_6) {
            return 24;
        } else {
            return 27;
        }
    }
}


- (UILabel *)createVerticalLabel:(NSString *)text attributes:(NSDictionary *)attributes
{
    UILabel *label = [UILabel new];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:[self createVerticalString:text] attributes:attributes];
    label.numberOfLines = text.length;
    label.attributedText = attributedString;
    return label;
}


- (NSMutableArray *)quoteLabels
{
    if(!_quoteLabels)
    {
        _quoteLabels = [NSMutableArray new];
    }
    return _quoteLabels;
}

- (NSString *)createVerticalString:(NSString *)text
{
    NSMutableArray *letterArray = [NSMutableArray new];
    [text enumerateSubstringsInRange:NSMakeRange(0, [text length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        [letterArray addObject:substring];
    }];
    return [letterArray componentsJoinedByString:@"\n"];
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


- (void)adjustSize
{
    if(!self.superview)
    {
        return;
    }
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        if(IS_IPHONE_4_OR_LESS)
        {
            make.height.equalTo(self.superview).multipliedBy(.85);
            make.width.equalTo(self.mas_height).multipliedBy(.75);
        }
        else
        {
            make.height.equalTo(self.superview).multipliedBy(.8);
            make.width.equalTo(self.superview).multipliedBy(.8);
        }
    }];
    
}

@end
