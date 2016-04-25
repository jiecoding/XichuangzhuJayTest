//
//  XCZUtils.m
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/22.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "XCZUtils.h"
#import "Constants.h"
@implementation XCZUtils

+ (NSString *)getDatabaseFilePath
{
    /*  1.一个是字体  2.存储数据库的 路径
     通常使用Documents目录进行数据持久化的保存，而这个Documents目录可以通过：
     NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserdomainMask，YES) 得到
     http://blog.csdn.net/xingxing513234072/article/details/24184917
     一定要注意 如果地址不对 数据库里没有表时 会出现查询不到的情况
//     */
    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSLog(@"documentsDirectory:%@",documentsDirectory);
//    NSString *storePath = [documentsDirectory stringByAppendingPathComponent:@"xcz.db"];
//    
//    DLog(@"[NSBundle mainBundle]:%@",[NSBundle mainBundle]);

    
//    return storePath;
    NSString *itemPath = @"xcz.db";
    NSArray *aArray = [itemPath componentsSeparatedByString:@"."];
    
    NSString *filename = [aArray objectAtIndex:0];
    NSString *sufix = [aArray objectAtIndex:1];
    
        DLog(@"filename:%@  sufix:%@",filename,sufix);
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:filename ofType:sufix];
    return dbPath;
}
@end
