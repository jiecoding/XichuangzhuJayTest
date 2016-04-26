//
//  XCZWorkViewController.m
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/26.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "XCZWorkViewController.h"
#import <Masonry/Masonry.h>
//#import "XCZWorkView.h"
@interface XCZWorkViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) UIBarButtonItem *likeButton;
@property (strong, nonatomic) UIBarButtonItem *unlikeButton;
@property (strong, nonatomic) UIBarButtonItem *wikiButton;
@property (strong, nonatomic) UIBarButtonItem *authorButton;

//@property (strong, nonatomic) XCZWorkView *workView;
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) XCZWork *work;
@property (strong, nonatomic) XCZQuote *quote;
@property (strong, nonatomic) NSArray *quotes;

@end



@implementation XCZWorkViewController
//loadView 方法是查看你有木有 xib，有的话就用 xib 加载基本信息，木有的话就会创建一个空白的 UIView，然后把它作为这个 ViewController 的 view。http://blog.csdn.net/prevention/article/details/18926447

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self createViews];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
}

- (instancetype)initWithWork:(XCZWork *)work quote:(XCZQuote *)quote{

    self.quote = quote;
    
    return  [self initWithWork:work];
}

- (instancetype)initWithWork:(XCZWork *)work
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.work = work;
    self.hidesBottomBarWhenPushed = YES;
    
    return self;
}


- (void)createViews
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 0)];
    
    tableView.delegate = self;
   
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:tableView];
    
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    XCZQuote *quote = self.quotes[indexPath.row];
    
    static NSString *IDESTR = @"IDESTR";
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDESTR];
    
    if(!cell)
    {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IDESTR];
       
    }
    
//    cell.textLabel.text = quote.quote;
    cell.textLabel.text = @"123456";

    
    return cell;
    
}

- (NSArray *)quotes
{
    if (!_quotes) {
        _quotes = [XCZQuote getByWorkId:self.work.id];
    }
    
    return _quotes;
}


@end
