//
//  XCZWork.m
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/26.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "XCZWork.h"
#import "XCZUtils.h"
#import <FMDB/FMDB.h>
@implementation XCZWork

+ (XCZWork *)getById:(int)workId
{
    XCZWork *work  = [[XCZWork alloc] init];
    
    NSString *dbPath = [XCZUtils getDatabaseFilePath];
    
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    
    if([db open])
    {
        FMResultSet *s  = [db executeQuery:[[NSString alloc]initWithFormat:@"SELECT * FROM works where id == %d",workId]];
        [s next];
        [work updateWithResultSet:s];
        [db close];
    }
    return work;
}

- (void)updateWithResultSet:(FMResultSet *)resultSet
{
    self.id = [resultSet intForColumn:@"id"];
    self.authorId = [resultSet intForColumn:@"author_id"];
    self.kind = [resultSet stringForColumn:@"kind"];
    self.layout = [resultSet stringForColumn:@"layout"];
    self.baiduWiki = [resultSet stringForColumn:@"baidu_wiki"];
    
    self.title = [resultSet stringForColumn:@"title"];
    self.fullTitle = [resultSet stringForColumn:@"full_title"];
    self.author = [resultSet stringForColumn:@"author"];
    self.dynasty = [resultSet stringForColumn:@"dynasty"];
    self.kindCN = [resultSet stringForColumn:@"kind_cn"];
    self.foreword = [resultSet stringForColumn:@"foreword"];
    self.content = [resultSet stringForColumn:@"content"];
    self.intro = [resultSet stringForColumn:@"intro"];
    
    self.titleTr = [resultSet stringForColumn:@"title_tr"];
    self.titleSim = [resultSet stringForColumn:@"title"];
    self.fullTitleTr = [resultSet stringForColumn:@"full_title_tr"];
    self.authorTr = [resultSet stringForColumn:@"author_tr"];
    self.dynastyTr = [resultSet stringForColumn:@"dynasty_tr"];
    self.kindCNTr = [resultSet stringForColumn:@"kind_cn_tr"];
    self.forewordTr = [resultSet stringForColumn:@"foreword_tr"];
    self.contentTr = [resultSet stringForColumn:@"content_tr"];
    self.introTr = [resultSet stringForColumn:@"intro_tr"];
    
    self.firstSentence = [XCZWork getFirstSentenceFromWorkContent:_content];
    self.firstSentenceTr = [XCZWork getFirstSentenceFromWorkContent:_contentTr];
}

+ (NSString *)getFirstSentenceFromWorkContent:(NSString *)content
{
    content = [[content componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] firstObject];
    NSArray *seperators = @[@"。", @"？", @"；", @"！"];
    
    NSInteger minLocation = -1;
    NSString *minSeperator;
    
    for (NSString *seperator in seperators) {
        NSInteger location = [content rangeOfString:seperator].location;
        if (location == NSNotFound) {
            continue;
        }
        
        if (minLocation == -1) {
            minLocation = location;
            minSeperator = seperator;
        } else if (location < minLocation){
            minLocation = location;
            minSeperator = seperator;
        }
    }
    
    if (minLocation == -1) {
        return content;
    } else {
        return [NSString stringWithFormat:@"%@%@", [[content componentsSeparatedByString:minSeperator] firstObject], minSeperator];
    }
}


@end
