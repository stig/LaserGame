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
    STAssertFalse([grid laserIsActive], nil);
    STAssertTrue([[grid at:@"1@1"] isKindOfClass:[BlankCell class]], nil);
}

- (void)testNonDefaultGridSizeInitialConditions {
    id grid = [[Grid alloc] initWithRows:4 columns:4];    
    STAssertFalse([grid laserIsActive], nil);
    STAssertTrue([[grid at:@"1@1"] isKindOfClass:[BlankCell class]], nil);
    STAssertTrue([[grid at:@"2@3"] isKindOfClass:[BlankCell class]], nil);
    STAssertTrue([[grid at:@"2@3"] isOff], nil);
}

- (void)testCellInteractions {
    id grid = [self generateDemoGrid];
    STAssertEquals([[grid cells] count], (unsigned)5 * 5, nil);
    
    id cell = [grid at:@"1@1"];
    STAssertTrue([cell isOff], nil);

    [grid activateCellsInPath];
    STAssertTrue([cell isOn], nil);
    
    NSArray *pathElements = [@"1@1 4@5 4@1 2@1 4@4 5@5 4@2 3@1 4@3" componentsSeparatedByString:@" "];
    for (id elem in [grid cells]) {
        if ([pathElements containsObject:elem])
            STAssertTrue([[grid at:elem] isOn], elem);
        else
            STAssertTrue([[grid at:elem] isOff], elem);
    }
}

#pragma mark Helper methods

- (id)generateDemoGrid {
    return [GridFactory demoGrid];
}


@end
