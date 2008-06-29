//
//  TargetCell.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "TargetCell.h"


@implementation TargetCell

- (id)init {
    self = [super init];
    if (!self)
        return nil;
    
    self.exitSides = [NSMutableDictionary new];
    if (!self.exitSides)
        return nil;
    
    [self.exitSides setObject:[NSNull null] forKey:@"North"];
    [self.exitSides setObject:[NSNull null] forKey:@"East"];
    [self.exitSides setObject:[NSNull null] forKey:@"South"];
    [self.exitSides setObject:[NSNull null] forKey:@"West"];
    
    return self;
}

@end
