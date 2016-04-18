//
//  TNSwitch.m
//  TNSwitch
//
//  Created by Trai Nguyen on 4/18/16.
//  Copyright © 2016 Trai Nguyen. All rights reserved.
//

#import "TNSwitch.h"

@implementation TNSwitch

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.clipsToBounds = true;
    if (self.imvStatus == nil) {
        //Create and add status image
        CGRect frame = CGRectZero;
        frame.size.width = self.frame.size.height*3/4;
        frame.size.height = frame.size.width;
        frame.origin.y = (self.frame.size.height - frame.size.height) / 2;
        self.imvStatus = [[UIImageView alloc] initWithFrame:frame];
        [self addSubview:self.imvStatus];
        [self.imvStatus.layer setCornerRadius:self.imvStatus.frame.size.height/2];
        
        //Add action on/off
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switcherDidTouch:)];
        [self addGestureRecognizer:tap];
    }
    //Set image with current status
    [self.imvStatus setImage:(self.currentStatus? self.imgOn: self.imgOff)];
    
    //Detect on/off position
    offPosition = (self.frame.size.height - self.imvStatus.frame.size.height) / 2;
    onPosition = self.frame.size.width - offPosition - self.imvStatus.frame.size.width;
    
    [self animationSwitcherButton:!self.currentStatus];
    
}

- (void)switcherDidTouch:(UITapGestureRecognizer *)gesture {
    [self animationSwitcherButton:_currentStatus];
    _currentStatus = !_currentStatus;
    if ([self.delegate respondsToSelector:@selector(switchDidChangeValue:)]) {
        [self.delegate switchDidChangeValue:_currentStatus];
    }
}

- (void)animationSwitcherButton:(BOOL)status {
    if (status) {
        // Clear Shadow
        self.imvStatus.layer.shadowOffset = CGSizeZero;
        self.imvStatus.layer.shadowOpacity = 0;
        self.imvStatus.layer.shadowRadius = self.imvStatus.frame.size.height / 2;
        self.imvStatus.layer.cornerRadius = self.imvStatus.frame.size.height / 2;
        self.imvStatus.layer.shadowPath = nil;
        
        // Rotate animation
        CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
        rotateAnimation.toValue = [NSNumber numberWithFloat:M_PI];
        rotateAnimation.duration = 0.5;
        rotateAnimation.cumulative = false;
        [self.imvStatus.layer addAnimation:rotateAnimation forKey:@"rotate"];
        
        // Move animation
        [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [self.imvStatus setImage:self.imgOff];
            CGRect frame = self.imvStatus.frame;
            frame.origin.x = offPosition;
            self.imvStatus.frame = frame;
            [self.imvStatus setBackgroundColor:self.bgColorOff];
        } completion:^(BOOL finished) {
        }];
    }
    else {
        
        // Rotate animation
        CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        rotateAnimation.fromValue = [NSNumber numberWithFloat:M_PI];
        rotateAnimation.toValue = [NSNumber numberWithFloat:0.0];
        rotateAnimation.duration = 0.5;
        rotateAnimation.cumulative = false;
        [self.imvStatus.layer addAnimation:rotateAnimation forKey:@"rotate"];
        
        // Move animation
        [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [self.imvStatus setImage:self.imgOn];
            CGRect frame = self.imvStatus.frame;
            frame.origin.x = onPosition;
            self.imvStatus.frame = frame;
            [self.imvStatus setBackgroundColor:self.bgColorOn];
            
            // Create Shadow
            self.imvStatus.layer.shadowOffset = CGSizeMake(0, 0.2);
            self.imvStatus.layer.shadowOpacity = 0.3;
            self.imvStatus.layer.shadowRadius = 5.0;
            self.imvStatus.layer.cornerRadius = self.imvStatus.frame.size.height / 2;
            self.imvStatus.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.imvStatus.layer.bounds cornerRadius:(self.imvStatus.frame.size.height / 2)].CGPath;
        } completion:^(BOOL finished) {
        }];
    }
}

@end
