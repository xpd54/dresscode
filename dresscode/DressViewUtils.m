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
    pickerImageView.allowsEditing = YES;
    pickerImageView.delegate = delegates;
    pickerImageView.sourceType = sourceType;
    return pickerImageView;
}

+ (NSString *) storeImage:(UIImage *)image withReferenceImageId:(NSString *)imageId {
    // save files in DocumentDirectoryN
    NSData *imageData = UIImagePNGRepresentation(image);
    NSString *filePath = [DressViewUtils documentsPathForImageId:imageId];
    
    [imageData writeToFile:filePath atomically:YES];
    return filePath;
}

+ (UIImage *) getImageWithReferenceImageId:(NSString *)imageId {
    NSString *filePath = [DressViewUtils documentsPathForImageId:imageId];
    NSData *imageData = [NSData dataWithContentsOfFile:filePath];
    return [UIImage imageWithData:imageData];
}

+ (NSString *)documentsPathForImageId:(NSString *)imageId {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *imageName = [NSString stringWithString:[NSString stringWithFormat:@"%@.png",imageId]];
    return [documentsPath stringByAppendingPathComponent:imageName];
}

@end
