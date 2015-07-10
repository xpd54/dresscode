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

@end

@implementation ViewController

- (void)viewDidLoad {
    [self setTitle:@"Login"];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        DressViewController *dressViewController = [[DressViewController alloc] init];
        dressViewController.loginButton = loginButton;
        [self.navigationController pushViewController:dressViewController animated:YES];
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
