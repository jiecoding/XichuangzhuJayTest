//
//  ViewController.m
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/20.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "XCZRandomQuoteViewController.h"
#import "UIColor+Helper.h"
#import <ionicons/IonIcons.h>
#import "XCZQuoteDraggableView.h"
#import <Masonry.h>
#import "XCZQuote.h"
#import "Constants.h"
#import "XCZQuoteDraggableView.h"
#import "XCZWorkViewController.h"

static CGFloat const SecondQuoteViewOriginalScale = 0.97;


@interface XCZRandomQuoteViewController ()<XCZQuoteDraggableDelegate,XCZQuoteViewDelegate>

@property (strong, nonatomic) XCZQuoteDraggableView *firstQuoteView;
@property (strong, nonatomic) XCZQuoteDraggableView *secondQuoteView;


@property (strong, nonatomic) NSMutableArray *quoteIds;


@end

@implementation XCZRandomQuoteViewController


- (void)loadView
{
    [super loadView];
  
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.view.backgroundColor = [UIColor colorWithRGBA:0xF0F0F0FF];

    [self createViews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self setupNavigationBar];
    
}

- (void)dragging:(CGFloat)factor
{
    CGFloat scale = SecondQuoteViewOriginalScale + (1 - SecondQuoteViewOriginalScale) * factor;
    self.secondQuoteView.transform = CGAffineTransformScale(CGAffineTransformIdentity, scale, scale);
}

- (void)loadQuoteView
{
    XCZQuote *randomQuote;
    
    if (self.quoteIds.count == 0) {
        
        randomQuote = [XCZQuote getRandomQuote];
        
    } else {
        randomQuote = [XCZQuote getRandomQuoteExcept:self.quoteIds];
    }
 
    
    XCZQuoteDraggableView *quoteView = [[XCZQuoteDraggableView alloc] initWithQuote:randomQuote];
    
        quoteView.deleagte =self;
    
    if(self.quoteIds.count == 10)
    {
        [self.quoteIds removeObjectAtIndex:0];
    }
    [self.quoteIds addObject:[NSString stringWithFormat:@"%d",randomQuote.id]];
    
    
    if (!self.firstQuoteView) {
        self.firstQuoteView = quoteView;
        self.firstQuoteView.userInteractionEnabled = YES;
        [self.view addSubview:quoteView];
    } else {
        if (self.secondQuoteView) {
            self.firstQuoteView = self.secondQuoteView;
            self.firstQuoteView.userInteractionEnabled = YES;
            self.secondQuoteView = quoteView;
        }
        
        self.secondQuoteView = quoteView;
     
        quoteView.transform = CGAffineTransformScale(CGAffineTransformIdentity, SecondQuoteViewOriginalScale, SecondQuoteViewOriginalScale);
     
        [self.view insertSubview:quoteView belowSubview:self.firstQuoteView];
     }
  
//     [self.view addSubview:quoteView];
    
    [quoteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];    
//    quoteView.frame = CGRectMake(40,100, 350, 500);
//    quoteView.center  = self.view.center;
    [quoteView adjustSize];
    
    
  
}

#pragma mark - XCZQuoteViewDelegate

- (void)quoteViewPressed:(XCZQuote *)quote
{
//    XCZWork *work = [XCZWork getById:quote.workId];
    XCZWorkViewController *controller = [[XCZWorkViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


- (void)willBackToCenter:(CGFloat)factor
{
    [UIView animateWithDuration:.3 animations:^{
        self.secondQuoteView.transform = CGAffineTransformScale(CGAffineTransformIdentity, SecondQuoteViewOriginalScale, SecondQuoteViewOriginalScale);
    }];
}


- (void)createViews
{
    [self loadQuoteView];
    [self loadQuoteView];

}

- (void)setupNavigationBar
{
    NSMutableArray *barbuttonsArr = [NSMutableArray new];
    
    //刷新 ion_ios_loop_strong unicode字符编码，就代表了一个字符
    UIImage *refreshImageIcon = [IonIcons imageWithIcon:ion_ios_loop_strong size:24 color:[UIColor colorWithRGBA:0x8D8D8DFF]];
    
    UIBarButtonItem *refreshBarButton = [[UIBarButtonItem alloc] initWithImage:refreshImageIcon style:UIBarButtonItemStylePlain target:self action:@selector(refreshQuote)];
    
    [barbuttonsArr addObject:refreshBarButton];

    
    //分享
    UIImage *shareImageIcon = [IonIcons imageWithIcon:ion_ios_paperplane_outline iconColor:[UIColor colorWithRGBA:0x8D8D8DFF] iconSize:35 imageSize:CGSizeMake(27, 35)];
    
    UIBarButtonItem *shareBarButton = [[UIBarButtonItem alloc] initWithImage:shareImageIcon style:UIBarButtonItemStylePlain target:self action:@selector(shareQuote)];
    
    [barbuttonsArr addObject:shareBarButton];

    
    //保存到相册
    UIImage *snapshontIcon = [IonIcons imageWithIcon:ion_ios_albums_outline size:23 color:[UIColor grayColor]];
    
    UIBarButtonItem *snapshontBarButton = [[UIBarButtonItem alloc] initWithImage:snapshontIcon style:UIBarButtonItemStylePlain target:self action:@selector(snapshot)];
    
    [barbuttonsArr addObject:snapshontBarButton];
    
    self.navigationItem.rightBarButtonItems = barbuttonsArr;
    
}

- (void)refreshQuote
{
   
}

- (void)shareQuote
{
    
    
}

- (void)snapshot
{

}

- (NSMutableArray *)quoteIds
{
    if (!_quoteIds) {
        _quoteIds = [NSMutableArray new];
    }
    
    return _quoteIds;
}

- (void)didDragRight:(UIView *)quoteView
{
    [self loadQuoteView];
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)didDragLeft:(UIView *)quoteView
{
    [self loadQuoteView];
    self.navigationItem.rightBarButtonItem.enabled = YES;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
