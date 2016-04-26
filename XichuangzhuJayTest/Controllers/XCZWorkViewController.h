//
//  XCZWorkViewController.h
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/26.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCZWork.h"
#import "XCZQuote.h"
@interface XCZWorkViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

- (instancetype)initWithWork:(XCZWork *)work quote:(XCZQuote *)quote;
- (instancetype)initWithWork:(XCZWork *)work;

@end
