//
//  DressViewController.h
//  dresscode
//
//  Created by Ravi Prakash on 11/07/15.
//  Copyright © 2015 xpd54. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagePreviewController.h"

@interface DressViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, ImagePreviewControllerDelegate>
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *firstName;
@end
