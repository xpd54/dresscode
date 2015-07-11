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

// get id string from UIImagePickerControllerReferenceURL To store image with uniqe name

- (NSString *) getIdOfReferenceURL:(NSURL *)URL {
    NSString *qeury = [URL query];
    __block NSString *idOfReferenceURL = [[NSString alloc] init];
    NSArray *component = [qeury componentsSeparatedByString:@"&"];
    [component enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        if(!([obj rangeOfString:@"id"].location == NSNotFound)){
            idOfReferenceURL = obj;
        }
    }];
    return idOfReferenceURL;
}

#pragma mark UIImagePickerControllerDelegate methods

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
    NSString *imageId = [self getIdOfReferenceURL:[info valueForKey:UIImagePickerControllerReferenceURL]];
    NSString *path = [DressViewUtils storeImage:image withReferenceImageId:imageId];
    NSLog(@"%@",path);
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
