//
//  SharedInstanceModel.m
//  GullyTrends
//
//  Created by Lakshmi Vajrapu on 04/11/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

#import "SharedInstanceModel.h"

@implementation SharedInstanceModel
{
    
}
#pragma mark --
#pragma mark Singleton Methods
/**
 * method for getting the instance of class
 */

+ (id)sharedInstance
{
    static SharedInstanceModel *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}
- (id)init {
    if (self = [super init]) {

    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

@end
