//
//  XCZQuoteDraggableView.h
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/21.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCZQuoteView.h"

@protocol XCZQuoteDraggableDelegate  <XCZQuoteViewDelegate>

- (void)didDragLeft:(UIView *)quoteView;

- (void)didDragRight:(UIView *)factor;


@optional
- (void)dragging:(CGFloat)factor;
- (void)willBackToCenter:(CGFloat)factor;

@end


@interface XCZQuoteDraggableView : XCZQuoteView

@property (weak,nonatomic)id <XCZQuoteDraggableDelegate> deleagte;

- (void)dragLeft;

- (void)dragRight;

@end
