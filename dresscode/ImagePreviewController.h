//
//  ImagePreviewController.h
//  dresscode
//
//  Created by Ravi Prakash on 11/07/15.
//  Copyright © 2015 xpd54. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ImagePreviewControllerDelegate <NSObject>
- (void) userDidSelectImage:(UIImage *)image;
@end

@interface ImagePreviewController : UIViewController
@property (weak,nonatomic) id <ImagePreviewControllerDelegate> imagePreviewDelegate;
@property (strong, nonatomic) UIImage *selectedImage;
@property (strong, nonatomic) UIImageView *imageView;
@end
