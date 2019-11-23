//
//  ViewController.m
//  GullyTrends
//
//  Created by Lakshmi Vajrapu on 30/10/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@import GoogleSignIn;

@interface ViewController ()

@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property(strong, nonatomic)  GIDSignInButton *signInButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.title = @"Gully Trends";
    [[self navigationController] setNavigationBarHidden:YES animated:YES];

//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    // Optional: Place the button in the center of your view.
//    loginButton.center = self.view.center;
//    [self.view addSubview:loginButton];
    if ([FBSDKAccessToken currentAccessToken]) {
     // User is logged in, do work such as go to next view controller.
    }
   [self applyGradientEffect];
    [self googlesignissetup];

}
-(void)googlesignissetup{
    [GIDSignIn sharedInstance].presentingViewController = self;
    [[GIDSignIn sharedInstance] restorePreviousSignIn];
   self.signInButton= [[GIDSignInButton alloc]initWithFrame:CGRectMake(220, 566, 110, 43) ];
   // [self.view addSubview:self.signInButton];

}
- (IBAction)didTapSignOut:(id)sender {
  [[GIDSignIn sharedInstance] signOut];
}

-(void)applyGradientEffect{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height)];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.startPoint = CGPointZero;
    gradient.endPoint = CGPointMake(0, 1);
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:80/255.0 green:24/255.0 blue:133/255.0 alpha:1.0] CGColor],(id)[[UIColor colorWithRed:14.0/255.0 green:27.0/255.0 blue:96/255.0 alpha:1.0] CGColor], nil];
   // [ self.view.layer addSublayer:gradient];
    [self.view.layer insertSublayer:gradient atIndex:0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
