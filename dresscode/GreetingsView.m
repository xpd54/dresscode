//
//  GreetingsView.m
//  dresscode
//
//  Created by Ravi Prakash on 11/07/15.
//  Copyright © 2015 xpd54. All rights reserved.
//

#import "GreetingsView.h"

@implementation GreetingsView

- (id) initWithFrame:(CGRect)frame andFirstName:(NSString *) firstName{
    self = [super initWithFrame:frame];
    if(self) {
        [self setupWithFirstName:firstName];
    }
    return self;
}

- (void) setupWithFirstName: (NSString *) firstName {
    [self setBackgroundColor:[UIColor clearColor]];
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    CGFloat greetingOriginX = width * 0.1;
    CGFloat greetingOriginY = height * 0.27;
    CGFloat greetingWidth = width * 0.8;
    CGFloat greetingHeight = height * 0.15;
    
    UILabel *greeting = [[UILabel alloc] initWithFrame:CGRectMake(greetingOriginX, greetingOriginY, greetingWidth, greetingHeight)];
    [greeting setLineBreakMode:NSLineBreakByWordWrapping];
    [greeting setNumberOfLines:0];
    [greeting setTextAlignment:NSTextAlignmentCenter];
    [greeting setText:[NSString stringWithFormat:@"Hey %@, \n It seems like you didn't Added anything",firstName]];
    [self addSubview:greeting];
}

@end
