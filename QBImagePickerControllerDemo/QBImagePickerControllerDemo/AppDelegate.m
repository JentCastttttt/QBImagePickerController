//
//  AppDelegate.m
//  QBImagePickerControllerDemo
//
//  Created by Cao JianRong on 14-8-25.
//  Copyright (c) 2014年 Cao JianRong. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate
@synthesize rootNaviController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];

    ViewController *viewController = [[ViewController alloc] init];
    viewController.title = @"首页";
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:viewController];
    [viewController release];
    //Navigation Title Color and FontStyle
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"STHeitiK-Medium" size:20],NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    navi.navigationBar.titleTextAttributes = dict;
    //origination from (0,20,width,height) not (0,0,width,height)
    navi.navigationBar.translucent = NO;
    //navigation background Color
    navi.navigationBar.barTintColor = [UIColor colorWithRed:151/255.0 green:217/255.0 blue:204/255.0 alpha:0.5];
    //navigation letf or right nafigationItem Color
    navi.navigationBar.tintColor = [UIColor whiteColor];
    self.rootNaviController = navi;
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController = navi;
    [navi release];
    [self.window makeKeyAndVisible];
    
    return YES;
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

-(void) dealloc
{
    [rootNaviController release];
    [super dealloc];
}

@end
