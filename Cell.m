//
//  Cell.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "Cell.h"
#import "GridDirection.h"

@implementation Cell

- (id)init {
    [super init];
    
    self.activeSegments = [NSMutableDictionary new];
    if (!activeSegments)
        return nil;
    
    [activeSegments setObject:[NSNumber numberWithBool:NO] forKey:North];
    [activeSegments setObject:[NSNumber numberWithBool:NO] forKey:East];
    [activeSegments setObject:[NSNumber numberWithBool:NO] forKey:South];
    [activeSegments setObject:[NSNumber numberWithBool:NO] forKey:West];

    return self;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"<%@: %@>", [self className], [self isOn] ? @"On" : @"Off"];
}

- (BOOL)isOn {
    return [[activeSegments allValues] indexOfObjectIdenticalTo:[NSNumber numberWithBool:YES]] != NSNotFound;
}

- (BOOL)isOff {
    return ![self isOn];
}

- (BOOL)isSegmentOnFor:(NSString*)direction {
    return [[activeSegments objectForKey:direction] boolValue];
}

- (NSString*)exitSideFor:(NSString*)enter {
    return [exitSides objectForKey:enter];
}

- (void)setLaserEntersFrom:(NSString*)direction {
    [activeSegments setObject:[NSNumber numberWithBool:1] forKey:direction];
    NSString *exit = [self exitSideFor:direction];
    [activeSegments setObject:[NSNumber numberWithBool:1] forKey:exit];
}

@synthesize activeSegments;
@synthesize exitSides;
@synthesize gridLocation;
@end
