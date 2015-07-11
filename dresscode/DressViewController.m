//
//  DressViewController.m
//  dresscode
//
//  Created by Ravi Prakash on 11/07/15.
//  Copyright © 2015 xpd54. All rights reserved.
//

#import "DressViewController.h"
#import "GreetingsView.h"
@interface DressViewController ()

@end

@implementation DressViewController

- (void)viewDidLoad {
    [self setTitle:@"Add Photo"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    GreetingsView *greetings = [[GreetingsView alloc] initWithFrame:self.view.bounds andFirstName:self.firstName];
    [self.view addSubview:greetings];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
