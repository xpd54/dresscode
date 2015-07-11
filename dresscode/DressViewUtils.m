//
//  DressViewUtils.m
//  dresscode
//
//  Created by Ravi Prakash on 11/07/15.
//  Copyright © 2015 xpd54. All rights reserved.
//

#import "DressViewUtils.h"

@implementation DressViewUtils

+ (UIImagePickerController *) imagePickerViewWithDelegates:(id<UIImagePickerControllerDelegate, UINavigationControllerDelegate>)delegates
                                            andSourceType:(UIImagePickerControllerSourceType)sourceType {
    
    UIImagePickerController *pickerImageView = [[UIImagePickerController alloc] init];
    pickerImageView.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    pickerImageView.allowsEditing = NO;
    pickerImageView.delegate = delegates;
    pickerImageView.sourceType = sourceType;
    return pickerImageView;
}


@end
