//
//  AppDelegate.m
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/20.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "XCZAppDelegate.h"
#import "XCZRandomQuoteViewController.h"
#import "Constants.h"
#import "LocalizeHelper.h"
#import <KSCrash/KSCrashInstallationStandard.h>
#define LocalizedString(key) [[LocalizeHelper sharedLocalSystem] localizedStringForKey:(key)]


@interface XCZAppDelegate ()

@end

@implementation XCZAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *factorySettings = @{@"SimplifiedChinese": @NO, @"QuoteFont": XCZFontWYFangsong};
    [defaults registerDefaults:factorySettings];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"SimplifiedChinese"]) {
        LocalizationSetLanguage(@"zh-Hans");
    } else {
        LocalizationSetLanguage(@"zh-Hant");
    }


    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    XCZRandomQuoteViewController *qouteVC = [[XCZRandomQuoteViewController alloc] init];
    
    UINavigationController *qouteNavVC = [[UINavigationController alloc] initWithRootViewController:qouteVC];
    
    
    
    self.window.rootViewController = qouteNavVC;
    
    
    //http://bughd.com/project/571dbf63a1de524a5700001c bug分析工具
//    KSCrashInstallationStandard* installation = [KSCrashInstallationStandard sharedInstance];
//    installation.url = [NSURL URLWithString:@"https://collector.bughd.com/kscrash?key=774f3f6389216bf24f6c4e1ff4e1fd9b"];
//    [installation install];
//    [installation sendAllReportsWithCompletion:nil];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
