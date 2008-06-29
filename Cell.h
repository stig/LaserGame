//
//  Cell.h
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Cell : NSObject {
    NSMutableDictionary *activeSegments;
    NSMutableDictionary *exitSides;
    NSString *gridLocation;
}

@property(retain) NSMutableDictionary *activeSegments;
@property(retain) NSMutableDictionary *exitSides;
@property(copy) NSString *gridLocation;

- (BOOL)isOn;
- (BOOL)isOff;
- (BOOL)isSegmentOnFor:(NSString*)direction;
- (NSString*)exitSideFor:(NSString*)enter;
- (void)setLaserEntersFrom:(NSString*)direction;

@end
