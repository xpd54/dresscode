//
//  DressViewUtils.h
//  dresscode
//
//  Created by Ravi Prakash on 11/07/15.
//  Copyright © 2015 xpd54. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DressViewUtils : NSObject
+ (UIImagePickerController *) imagePickerViewWithDelegates:(id<UIImagePickerControllerDelegate, UINavigationControllerDelegate>)delegates
                                            andSourceType:(UIImagePickerControllerSourceType)sourceType;

@end
