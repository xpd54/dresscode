//
//  ViewController.m
//  dresscode
//
//  Created by Ravi Prakash on 10/07/15.
//  Copyright © 2015 xpd54. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    [self setTitle:@"Login"];
    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"=========");
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
