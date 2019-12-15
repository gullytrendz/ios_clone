//
//  CustomView.m
//  GullyTrends
//
//  Created by Lakshmi Vajrapu on 30/10/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

#import "CustomView.h"

IB_DESIGNABLE

@implementation CustomView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self cornerRadiusCustom];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self cornerRadiusCustom];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self cornerRadiusCustom];
}

- (void)setNeedsLayout {
    [super setNeedsLayout];
    [self setNeedsDisplay];
}

- (void)prepareForInterfaceBuilder {
    [self cornerRadiusCustom];
}

-(void)cornerRadiusCustom{
    self.layer.cornerRadius = self.cornerRadius;
    self.layer.borderWidth = self.borderWidth;
    self.layer.borderColor = self.borderColor.CGColor;
    if (self.cornerRadius > 0) {
        self.layer.masksToBounds = YES;
    }
}




@end
