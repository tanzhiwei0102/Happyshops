//
//  AppDelegate.m
//  Happyshops
//
//  Created by TanZhiWei on 16/4/1.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
@interface AppDelegate ()<EAIntroDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    MainViewController *rootVC = [[MainViewController alloc]init];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    
    // 设置引导页
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    // 引导页设置
    if ([ud valueForKey:@"bool"]== nil) {
        [ud setValue:@"yes" forKey:@"bool"];
        [self showIntroWithCrossDissolve];
    }
    if ([[ud valueForKey:@"bool"]isEqualToString:@"yes"]) {
        
    }
    return YES;
}
-(void)showIntroWithCrossDissolve
{
    EAIntroPage *page1 = [EAIntroPage page];
    //    page1.titleFont = [UIFont fontWithName:@"MarkerFelt" size:24];
    page1.title = @"只要新的！";
    page1.desc = @"品质都一样，团购更省钱!团实惠，购惊喜，尽在欢乐购。做你生活的知己，送您炫彩生活";
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"不占便宜！";
    page2.desc = @"品质都一样，团购更省钱!团实惠，购惊喜，尽在欢乐购。做你生活的知己，送您炫彩生活";
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"大家齐心！";
    page3.desc = @"品质都一样，团购更省钱!团实惠，购惊喜，尽在欢乐购。做你生活的知己，送您炫彩生活";
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    
    EAIntroPage * page4 = [EAIntroPage page];
    page4.title = @"来买好的！";
    page4.desc = @"品质都一样，团购更省钱!团实惠，购惊喜，尽在欢乐购。做你生活的知己，送您炫彩生活";
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];
    
    
    
    
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.window.rootViewController.view.bounds andPages:@[page1,page2,page3,page4]];
    
    [intro setDelegate:self];
    
    [intro showInView:self.window.rootViewController.view animateDuration:0.0];
    
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
