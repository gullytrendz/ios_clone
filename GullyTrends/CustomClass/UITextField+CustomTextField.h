//
//  UITextField+CustomTextField.h
//  GullyTrends
//
//  Created by Lakshmi Vajrapu on 24/11/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField ()

@end

NS_ASSUME_NONNULL_END
@implementation

-(void)addRightView:(UIimageView *)image{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 26, 26)];
    imgView.image = [UIImage imageNamed:@"img.png"];

    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView addSubview:imgView];
    [txtField setLeftViewMode:UITextFieldViewModeAlways];
    [txtField setLeftView:paddingView];

}

@end
