//
//  XCZQuoteView.h
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/22.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCZQuote.h"

@protocol XCZQuoteViewDelegate <NSObject>

- (void)quoteViewPressed:(XCZQuote *)quote;

@end

@interface XCZQuoteView : UIView


@property (strong, nonatomic) XCZQuote *quote;
@property (strong, nonatomic) NSMutableArray *quoteLabels;


- (instancetype)initWithQuote:(XCZQuote *)quote;


@end
