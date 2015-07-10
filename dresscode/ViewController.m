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
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(profileGetUpdated:) name:FBSDKProfileDidChangeNotification object:nil];

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) showDressView {
    if ([FBSDKAccessToken currentAccessToken]) {
        DressViewController *dressViewController = [[DressViewController alloc] init];
        dressViewController.userId = [FBSDKProfile currentProfile].userID;
        dressViewController.firstName = [FBSDKProfile currentProfile].firstName;
        [self.navigationController pushViewController:dressViewController animated:YES];
    }
}

-(void)profileGetUpdated:(NSNotification *) notification{
    [self showDressView];
}

#pragma mark FBSDKLoginButtonDelegate method

- (void) loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    
}

- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}


@end
