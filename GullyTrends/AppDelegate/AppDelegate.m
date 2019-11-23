//
//  AppDelegate.m
//  GullyTrends
//
//  Created by Lakshmi Vajrapu on 30/10/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
        configuration.applicationId = @"oK1ANsHVo1zKMZsfdeM2C0ixW8spsXw2JWBnP5nJ";
        configuration.clientKey = @"yRQD1tX8bbuEixkgYf0pFlQ7T59g4T1YzweFVRPU";
        configuration.server = @"https://parseapi.back4app.com";
        
    }]];
    [self saveInstallationObject];
    [[FBSDKApplicationDelegate sharedInstance] application:application
      didFinishLaunchingWithOptions:launchOptions];
     [self googleSignin];
    
    return YES;
}

-(void)pfLogin{
    PFQuery *query = [PFQuery queryWithClassName:@"Login"];
       [query getObjectInBackgroundWithId:@"XmP7LK5dSr" block:^(PFObject *parseObject, NSError *error) {
           if (!error) {
               // Success!
           } else {
               // Failure!
           }
       }];
    
    
    PFObject *myFirstClass = [PFObject objectWithClassName:@"Login"];
    myFirstClass[@"Username"] = @"Priya";
    [myFirstClass saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
      if (succeeded) {
        // The object has been saved.
      } else {
        // There was a problem, check error.description
      }
    }];
}

-(void)saveInstallationObject{
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"You have successfully connected your app to Back4App!");
        }else{
            NSLog(@"installation save failed %@",error.debugDescription);
        }
    }];
}

#pragma mark - OpenURL

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
 
    
  BOOL facebookDidHandle = [[FBSDKApplicationDelegate sharedInstance] application:application
    openURL:url
    sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
    annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
  ];
        
      return facebookDidHandle || [[GIDSignIn sharedInstance] handleURL:url] ;
}

#pragma mark - UISceneSession lifecycle

-(void)googleSignin{
    [GIDSignIn sharedInstance].clientID = @"571839247263-pbbp937askcf4mrk0mj3ej478flnam0a.apps.googleusercontent.com";
    [GIDSignIn sharedInstance].delegate = self;
}

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
  if (error != nil) {
    if (error.code == kGIDSignInErrorCodeHasNoAuthInKeychain) {
      NSLog(@"The user has not signed in before or they have since signed out.");
    } else {
      NSLog(@"%@", error.localizedDescription);
    }
    return;
  }
  // Perform any operations on signed in user here.
 // NSString *userId = user.userID;                  // For client-side use only!
  // ...
}

- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
  // Perform any operations when the user disconnects from  here.
  // ...
}

@end
