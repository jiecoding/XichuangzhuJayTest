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
@interface XCZRandomQuoteViewController ()

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

- (void)createViews
{
    XCZQuoteDraggableView *quoteDraggableView = [[XCZQuoteDraggableView alloc] initWithFrame:CGRectMake(40,100, 350, 500)];
    
    quoteDraggableView.center = self.view.center;
    
    
    
    
    [self.view addSubview:quoteDraggableView];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
