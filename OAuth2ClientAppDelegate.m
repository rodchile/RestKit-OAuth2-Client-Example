//
//  OAuth2ClientAppDelegate.m
//  OAuth2Client
//
//  Created by Rodrigo Garcia on 8/27/11.
//  Copyright 2011 Excelsys Soluciones SpA. All rights reserved.
//

#import "OAuth2ClientAppDelegate.h"
#import "OAuth2ClientConstants.h"
#import "OAuth2ClientViewController.h"

@implementation OAuth2ClientAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // To get an authorizationCode for this example you should visit this URL in Google
    // https://accounts.google.com/o/oauth2/auth?client_id=[PUT YOUR CLIENT ID HERE]&redirect_uri=[PUT YOUR CALLBACK URL HERE]b&response_type=code&scope=http://www.google.com/m8/feeds
    // (Don't worry, I can't get access to any information in your account, I followed a Google example: http://code.google.com/apis/accounts/docs/OAuth2.html#IA )
    
    oauth2Client = [RKClientOAuth clientWithClientID:OAuth2ClientId secret:OAuth2ClientSecret delegate:self];
    
    [oauth2Client setAuthorizationURL:OAuth2AuthorizationURL];
    [oauth2Client setAuthorizationCode:OAuth2AuthorizationCode]; 
    [oauth2Client setCallbackURL:OAuth2ClientCallback];
    [oauth2Client validateAuthorizationCode];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[OAuth2ClientViewController alloc] initWithNibName:@"OAuth2ClientViewController_iPhone" bundle:nil]; 
    } else {
        self.viewController = [[OAuth2ClientViewController alloc] initWithNibName:@"OAuth2ClientViewController_iPad" bundle:nil]; 
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

-(void)accessTokenAcquired:(NSString *)token{
    NSLog(@"Access Token Acquired: %@",token);
}

-(void)errInvalidGrant:(NSString *)description{
    NSLog(@"Error: %@",description);

}

@end
