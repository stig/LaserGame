//
//  BlankCell.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "BlankCell.h"


@implementation BlankCell

- (id)init {
    self = [super init];
    if (!self)
        return nil;
    
    self.exitSides = [NSMutableDictionary new];
    if (!self.exitSides)
        return nil;

    [self.exitSides setObject:@"South" forKey:@"North"];
    [self.exitSides setObject:@"West" forKey:@"East"];
    [self.exitSides setObject:@"North" forKey:@"South"];
    [self.exitSides setObject:@"East" forKey:@"West"];

    return self;
}

@end
