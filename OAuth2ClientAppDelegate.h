//
//  OAuth2ClientAppDelegate.h
//  OAuth2Client
//
//  Created by Rodrigo Garcia on 8/27/11.
//  Copyright 2011 Excelsys Soluciones SpA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@class OAuth2ClientViewController;

@interface OAuth2ClientAppDelegate : UIResponder <UIApplicationDelegate, RKOAuth2Delegate>{
    RKClientOAuth* oauth2Client;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) OAuth2ClientViewController *viewController;

@end
