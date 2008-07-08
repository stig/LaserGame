//
//  GridUnit.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "GridUnit.h"
#import "Grid.h"
#import "GridFactory.h"
#import "BlankCell.h"
#import "MirrorCell.h"
#import "TargetCell.h"

#define Point(x, y) NSMakePoint(x, y)
#define VPoint(x, y) [NSValue valueWithPoint:NSMakePoint(x, y)]

@implementation GridUnit

- (void)testInitialConditions {
    id grid = [Grid new];
    STAssertFalse([grid laserActive], nil);
    STAssertEquals([grid laserLength], (unsigned)0, nil);
    STAssertTrue([[grid at:Point(1, 1)] isKindOfClass:[BlankCell class]], nil);
}

- (void)testNonDefaultGridSizeInitialConditions {
    id grid = [[Grid alloc] initWithRows:4 columns:4];    
    STAssertFalse([grid laserActive], nil);
    STAssertEquals([grid laserLength], (unsigned)0, nil);
    STAssertTrue([[grid at:Point(1, 1)] isKindOfClass:[BlankCell class]], nil);
    STAssertTrue([[grid at:Point(2, 3)] isKindOfClass:[BlankCell class]], nil);
    STAssertTrue([[grid at:Point(2, 3)] isOff], nil);
}

- (void)testCellInteractions {
    id grid = [GridFactory demoGrid];
    STAssertFalse([grid laserActive], nil);
    STAssertEquals([grid laserLength], (unsigned)0, nil);
    STAssertEquals([[grid cells] count], (unsigned)5 * 5, nil);
    
    id cell = [grid at:Point(0, 0)];
    STAssertTrue([cell isOff], nil);

    [grid activateCellsInPath];
    STAssertTrue([cell isOn], nil);    
    STAssertEquals([grid laserLength], (unsigned)9, nil);
    
    NSSet *pathElements = [NSSet setWithObjects:
                           VPoint(0, 0),
                           VPoint(1, 0),
                           VPoint(2, 0),
                           VPoint(3, 0),
                           VPoint(3, 1),
                           VPoint(3, 2),
                           VPoint(3, 3),
                           VPoint(3, 4),
                           VPoint(4, 4),
                           nil];

    for (NSValue *elem in [grid cells]) {
        id cell = [grid at:[elem pointValue]];
        if ([pathElements containsObject:elem])
            STAssertTrue([cell isOn], @"%@", cell);
        else
            STAssertTrue([cell isOff], @"%@", cell);
    }
}

- (void)testFireLaser {
    id grid = [GridFactory demoGrid];
    [grid fireLaser];
    STAssertTrue([grid laserActive], nil);
    STAssertTrue([[grid at:Point(4, 4)] isOn], nil);
}

- (void)testStopLaser {
    id grid = [GridFactory demoGrid];
    [grid stopLaser];
    STAssertFalse([grid laserActive], nil);
    STAssertFalse([[grid at:Point(4, 4)] isOn], nil);
}

- (void)testToggleLaser {
    id grid = [GridFactory demoGrid];
    [grid fireLaser];
    [grid stopLaser];
    STAssertFalse([grid laserActive], nil);
    STAssertFalse([[grid at:Point(4, 4)] isOn], nil);
}


@end
