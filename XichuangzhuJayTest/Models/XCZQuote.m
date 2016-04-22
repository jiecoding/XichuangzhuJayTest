//
//  XCZQuote.m
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/22.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "XCZQuote.h"
#import "XCZUtils.h"
#import <FMDB/FMDB.h>
@implementation XCZQuote


+ (XCZQuote *)getRandomQuote
{
    XCZQuote *quote = [[XCZQuote alloc] init];
    
    NSString *dbPath = [XCZUtils getDatabaseFilePath];
    
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if([db open])
    {
        //对数据库进行随机查询 limit 1 查询一条数据
        FMResultSet *fmresultSet = [db executeQuery:@"SELECT * FROM quotes ORDER BY RANDOM() LIMIT 1"];
        [fmresultSet next];
        [quote loadFromResultSet:fmresultSet];
        [db close];
    }
    return quote;
    
}

+ (XCZQuote *)getRandomQuoteExcept:(NSArray *)quoteIds
{
    XCZQuote * quote = [[XCZQuote alloc] init];
    
    NSString *dbPath = [XCZUtils getDatabaseFilePath];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if ([db open]) {
        NSString *queryString = [NSString stringWithFormat:@"SELECT * FROM quotes WHERE id NOT IN (%@) ORDER BY RANDOM() LIMIT 1", [quoteIds componentsJoinedByString:@", "]];
        FMResultSet *s = [db executeQuery:queryString];
        [s next];
        [quote loadFromResultSet:s];
        [db close];
    }
    
    return quote;
}


- (void)loadFromResultSet:(FMResultSet *)resultSet
{
    self.id = [resultSet intForColumn:@"id"];
    self.authorId = [resultSet intForColumn:@"author_id"];
    self.workId = [resultSet intForColumn:@"work_id"];
    
    self.quote = [resultSet stringForColumn:@"quote"];
    self.author = [resultSet stringForColumn:@"author"];
    self.work = [resultSet stringForColumn:@"work"];
    
    self.quoteTr = [resultSet stringForColumn:@"quote_tr"];
    self.authorTr = [resultSet stringForColumn:@"author_tr"];
    self.workTr = [resultSet stringForColumn:@"work_tr"];
    
}


@end
