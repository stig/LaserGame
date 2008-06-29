//
//  Cell.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "Cell.h"


@implementation Cell

- (id)init {
    [super init];
    
    self.activeSegments = [NSMutableDictionary new];
    if (!self.activeSegments)
        return nil;
    
    [self.activeSegments setObject:[NSNumber numberWithBool:NO] forKey:@"North"];
    [self.activeSegments setObject:[NSNumber numberWithBool:NO] forKey:@"East"];
    [self.activeSegments setObject:[NSNumber numberWithBool:NO] forKey:@"South"];
    [self.activeSegments setObject:[NSNumber numberWithBool:NO] forKey:@"West"];

    return self;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"<%@: %@>", [self className], [self isOn] ? @"On" : @"Off"];
}

- (BOOL)isOn {
    return [[self.activeSegments allValues] indexOfObjectIdenticalTo:[NSNumber numberWithBool:YES]] != NSNotFound;
}

- (BOOL)isOff {
    return ![self isOn];
}

- (BOOL)isSegmentOnFor:(NSString*)direction {
    return [[self.activeSegments objectForKey:direction] boolValue];
}

- (NSString*)exitSideFor:(NSString*)enter {
    return [self.exitSides objectForKey:enter];
}

- (void)setLaserEntersFrom:(NSString*)direction {
    [self.activeSegments setObject:[NSNumber numberWithBool:1] forKey:direction];
    NSString *exit = [self exitSideFor:direction];
    [self.activeSegments setObject:[NSNumber numberWithBool:1] forKey:exit];
}

@synthesize activeSegments;
@synthesize exitSides;
@synthesize gridLocation;
@end
