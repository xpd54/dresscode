//
//  ViewController.m
//  dresscode
//
//  Created by Ravi Prakash on 10/07/15.
//  Copyright © 2015 xpd54. All rights reserved.
//

#import "ViewController.h"
#import "DressViewController.h"

@interface ViewController ()
@property (strong, nonatomic) FBSDKLoginButton *loginButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [self setTitle:@"Login"];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    self.loginButton = [[FBSDKLoginButton alloc] init];
    self.loginButton.center = self.view.center;
    self.loginButton.delegate = self;

    [self.view addSubview:self.loginButton];
    [self showDressView];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) showDressView {
    if ([FBSDKAccessToken currentAccessToken]) {
        DressViewController *dressViewController = [[DressViewController alloc] init];
        [self.navigationController pushViewController:dressViewController animated:YES];
    }
}

#pragma mark FBSDKLoginButtonDelegate method

- (void) loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    if (!result.isCancelled) {
        [self showDressView];
    }
    NSLog(@"========");
}

- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    NSLog(@"-------");
}

@end
