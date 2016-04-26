//
//  XCZWork.h
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/26.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCZWork : NSObject

@property (nonatomic,strong)NSString *title;
@property (nonatomic) int id;

@property (nonatomic, strong) NSString *fullTitle;
@property (nonatomic) int authorId;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *dynasty;
@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) NSString *kindCN;
@property (nonatomic, strong) NSString *foreword;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *layout;
@property (nonatomic, strong) NSString *baiduWiki;
@property (nonatomic, strong) NSString *firstSentence;
@property (nonatomic) int showOrder;
@property (strong, nonatomic) NSArray *collections;


@property (strong, nonatomic) NSString *titleTr;
@property (nonatomic, strong) NSString *titleSim;
@property (strong, nonatomic) NSString *fullTitleTr;
@property (strong, nonatomic) NSString *authorTr;
@property (strong, nonatomic) NSString *dynastyTr;
@property (strong, nonatomic) NSString *kindCNTr;
@property (strong, nonatomic) NSString *forewordTr;
@property (strong, nonatomic) NSString *contentTr;
@property (strong, nonatomic) NSString *introTr;
@property (strong, nonatomic) NSString *firstSentenceTr;

+ (XCZWork *)getById:(int)workId;

@end
