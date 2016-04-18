//
//  TNSwitch.h
//  TNSwitch
//
//  Created by Trai Nguyen on 4/18/16.
//  Copyright © 2016 Trai Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TNSwitchChangeValueDelegate <NSObject>
- (void)switchDidChangeValue:(BOOL)status;
@end

@interface TNSwitch : UIView{
    CGFloat offPosition;
    CGFloat onPosition;
}

@property (weak, nonatomic) id<TNSwitchChangeValueDelegate> delegate;

IB_DESIGNABLE
@property (strong, nonatomic) UIImageView *imvStatus;
@property (strong, nonatomic) IBInspectable UIImage *imgOn;
@property (strong, nonatomic) IBInspectable UIImage *imgOff;
@property (strong, nonatomic) IBInspectable UIColor *bgColorOn;
@property (strong, nonatomic) IBInspectable UIColor *bgColorOff;
@property (assign, nonatomic) IBInspectable BOOL currentStatus;

@end
