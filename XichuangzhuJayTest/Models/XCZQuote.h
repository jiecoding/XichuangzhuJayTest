//
//  XCZQuote.h
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/22.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCZQuote : NSObject

@property (nonatomic) int id;
@property (nonatomic, strong) NSString *quote;
@property (nonatomic) int authorId;
@property (nonatomic, strong) NSString *author;
@property (nonatomic) int workId;
@property (nonatomic, strong) NSString *work;
@property (nonatomic, strong) NSArray *pieces;
@property (strong, nonatomic) NSString *quoteTr;
@property (strong, nonatomic) NSString *authorTr;
@property (strong, nonatomic) NSString *workTr;

//获取一条随机摘录
+ (XCZQuote *)getRandomQuote;

+ (XCZQuote *)getRandomQuoteExcept:(NSArray *)quoteIds;


@end
