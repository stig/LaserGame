//
//  TargetCellUnit.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "TargetCellUnit.h"
#import "TargetCell.h"
#import "GridDirection.h"

@implementation TargetCellUnit

- (void)testCellOnState {
    id cell = [TargetCell new];
    STAssertFalse([cell isOn], nil);
    STAssertTrue([cell isOff], nil);
}

- (void)testCellSegmentState {
    id cell = [TargetCell new];
    STAssertFalse([cell isSegmentOnFor:North], nil);
    STAssertFalse([cell isSegmentOnFor:East], nil);
    STAssertFalse([cell isSegmentOnFor:South], nil);
    STAssertFalse([cell isSegmentOnFor:West], nil);
}

- (void)testExitSides {
    id cell = [TargetCell new];
    for (id direction in [@"North East South West" componentsSeparatedByString:@" "])
        STAssertEqualObjects([cell exitSideFor:direction], [NSNull null], nil);
}

- (void)testCellLaserActivity {
    id cell = [TargetCell new];
    [cell setLaserEntersFrom:North];
    STAssertTrue([cell isOn], nil);
    STAssertTrue([cell isSegmentOnFor:North], nil);
    STAssertFalse([cell isSegmentOnFor:East], nil);
    STAssertFalse([cell isSegmentOnFor:South], nil);
    STAssertFalse([cell isSegmentOnFor:West], nil);
}

@end
