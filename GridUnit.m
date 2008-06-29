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

@implementation GridUnit

- (void)testInitialConditions {
    id grid = [Grid new];
    STAssertFalse([grid laserActive], nil);
    STAssertTrue([[grid at:[NSValue valueWithPoint:NSMakePoint(1, 1)]] isKindOfClass:[BlankCell class]], nil);
}

- (void)testNonDefaultGridSizeInitialConditions {
    id grid = [[Grid alloc] initWithRows:4 columns:4];    
    STAssertFalse([grid laserActive], nil);
    STAssertTrue([[grid at:[NSValue valueWithPoint:NSMakePoint(1, 1)]] isKindOfClass:[BlankCell class]], nil);
    STAssertTrue([[grid at:[NSValue valueWithPoint:NSMakePoint(2, 3)]] isKindOfClass:[BlankCell class]], nil);
    STAssertTrue([[grid at:[NSValue valueWithPoint:NSMakePoint(2, 3)]] isOff], nil);
}

- (void)testCellInteractions {
    id grid = [GridFactory demoGrid];
    
    STAssertEquals([[grid cells] count], (unsigned)5 * 5, nil);
    
    id cell = [grid at:[NSValue valueWithPoint:NSMakePoint(0, 0)]];
    STAssertTrue([cell isOff], nil);

    [grid activateCellsInPath];
    STAssertTrue([cell isOn], nil);    

    NSSet *pathElements = [NSSet setWithObjects:
                           [NSValue valueWithPoint:NSMakePoint(0, 0)],
                           [NSValue valueWithPoint:NSMakePoint(1, 0)],
                           [NSValue valueWithPoint:NSMakePoint(2, 0)],
                           [NSValue valueWithPoint:NSMakePoint(3, 0)],
                           [NSValue valueWithPoint:NSMakePoint(3, 1)],
                           [NSValue valueWithPoint:NSMakePoint(3, 2)],
                           [NSValue valueWithPoint:NSMakePoint(3, 3)],
                           [NSValue valueWithPoint:NSMakePoint(3, 4)],
                           [NSValue valueWithPoint:NSMakePoint(4, 4)],
                           nil];

    for (NSValue *elem in [grid cells]) {
        id cell = [grid at:elem];
        if ([pathElements containsObject:elem])
            STAssertTrue([cell isOn], @"%@", cell);
        else
            STAssertTrue([cell isOff], @"%@", cell);
    }
    
    STAssertEquals([grid laserLength], [pathElements count], nil);
}

@end
