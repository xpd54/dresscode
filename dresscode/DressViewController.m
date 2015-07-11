//
//  DressViewController.m
//  dresscode
//
//  Created by Ravi Prakash on 11/07/15.
//  Copyright © 2015 xpd54. All rights reserved.
//

#import "DressViewController.h"
#import "GreetingsView.h"
#import "DressViewUtils.h"
@interface DressViewController ()

@end

@implementation DressViewController

- (void) loadView {
    UIBarButtonItem *addImageButton = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(addStuff)];
    [[self navigationItem] setRightBarButtonItem:addImageButton];
    [super loadView];
}

- (void)viewDidLoad {
    [self setTitle:@"Add Photo"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    GreetingsView *greetings = [[GreetingsView alloc] initWithFrame:self.view.bounds andFirstName:self.firstName];
    [self.view addSubview:greetings];
    [super viewDidLoad];
}

- (void) addStuff {
    [self pickImageFromGallery];
}

- (void) pickImageFromGallery {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImagePickerController *imagePickerView = [DressViewUtils imagePickerViewWithDelegates:self
                                                                    andSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
            [self presentViewController:imagePickerView animated:YES completion:NULL];
    });
}

#pragma mark UIImagePickerControllerDelegate methods

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"info %@",info);
    [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark HSPreviewControllerDelegate method

- (void) userDidSelectImage:(UIImage *)image {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
