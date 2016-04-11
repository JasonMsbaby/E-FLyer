//
//  AppDelegate.m
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideViewController.h"
#import "TabBarController.h"
@implementation AppDelegate
- (void)dealloc
{
    [_window release];
    [super dealloc];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]autorelease];
    // Override point for customization after application launch.
    
    
    
    
    //创建根视图控制器
    if (![[NSUserDefaults standardUserDefaults]boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"firstLaunched"];
    }else
    {
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"firstLaunched"];
    }
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"firstLaunched"]) {
        GuideViewController * use = [[GuideViewController alloc]init];
        self.window.rootViewController = use;
        [use release];
        
    }else{
        TabBarController *houseTBC = [[TabBarController alloc]init];
        houseTBC.tabBar.translucent = NO;  //ios7
        houseTBC.tabBar.selectedImageTintColor = [UIColor colorWithRed:235/255.0 green:155/255.0 blue:0 alpha:1];
        self.window.rootViewController = houseTBC;
        [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
        [houseTBC release];
    }
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}




- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
