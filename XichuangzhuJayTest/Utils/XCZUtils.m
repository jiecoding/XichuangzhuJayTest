//
//  XCZUtils.m
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/22.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "XCZUtils.h"

@implementation XCZUtils

+ (NSString *)getDatabaseFilePath
{
    /*
     通常使用Documents目录进行数据持久化的保存，而这个Documents目录可以通过：
     NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserdomainMask，YES) 得到
     http://blog.csdn.net/xingxing513234072/article/details/24184917
     一定要注意 如果地址不对 数据库里没有表时 会出现查询不到的情况
     */
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *storePath = [documentsDirectory stringByAppendingPathComponent:@"xcz.db"];
    return storePath;
}
@end
