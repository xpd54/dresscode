//
//  ImagePreviewController.m
//  dresscode
//
//  Created by Ravi Prakash on 11/07/15.
//  Copyright © 2015 xpd54. All rights reserved.
//

#import "ImagePreviewController.h"

@interface ImagePreviewController ()

@end

@implementation ImagePreviewController

- (void) loadView {
    self.view = [[UIView alloc] init];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20,
                                                                          84,
                                                                          [UIScreen mainScreen].bounds.size.width - 40,
                                                                          [UIScreen mainScreen].bounds.size.height)];
    [self.imageView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.imageView.layer setBorderWidth:1.0f];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:self.imageView];
    
    UIBarButtonItem *sendButton = [[UIBarButtonItem alloc] initWithTitle:@"Select" style:UIBarButtonItemStylePlain target:self action:@selector(selectImage)];
    [self.navigationItem setRightBarButtonItem:sendButton];
    self.title = @"Image";
}

- (void) selectImage {
    [self.imagePreviewDelegate userDidSelectImage:self.selectedImage];
}

- (void) viewWillAppear:(BOOL)animated {
    if(self.selectedImage) {
        [self.imageView setImage:self.selectedImage];
    }
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [super viewDidLoad];
}

@end
