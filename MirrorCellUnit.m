//
//  MirrorCellUnit.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "MirrorCellUnit.h"
#import "MirrorCell.h"
#import "GridDirection.h"

@implementation MirrorCellUnit

- (void)testCellOnState {
    id cell = [MirrorCell new];
    STAssertFalse([cell isOn], nil);
    STAssertTrue([cell isOff], nil);
}

- (void)testCellSegmentState {
    id cell = [MirrorCell new];
    STAssertFalse([cell isSegmentOnFor:North], nil);
    STAssertFalse([cell isSegmentOnFor:East], nil);
    STAssertFalse([cell isSegmentOnFor:South], nil);
    STAssertFalse([cell isSegmentOnFor:West], nil);
}

- (void)testExitSidesMirrorLeft {
    id cell = [MirrorCell new];
    [cell leanLeft];
    STAssertEqualObjects([cell exitSideFor:North], East, nil);
    STAssertEqualObjects([cell exitSideFor:East], North, nil);
    STAssertEqualObjects([cell exitSideFor:South], West, nil);
    STAssertEqualObjects([cell exitSideFor:West], South, nil);
}

- (void)testExitSidesMirrorRight {
    id cell = [MirrorCell leanRight];
    STAssertEqualObjects([cell exitSideFor:North], West, nil);
    STAssertEqualObjects([cell exitSideFor:East], South, nil);
    STAssertEqualObjects([cell exitSideFor:South], East, nil);
    STAssertEqualObjects([cell exitSideFor:West], North, nil);
}

- (void)testCellLaserActivityMirrorLeft {
    id cell = [MirrorCell leanLeft];
    [cell setLaserEntersFrom:North];
    STAssertTrue([cell isOn], nil);
    STAssertTrue([cell isSegmentOnFor:North], nil);
    STAssertTrue([cell isSegmentOnFor:East], nil);
    STAssertFalse([cell isSegmentOnFor:South], nil);
    STAssertFalse([cell isSegmentOnFor:West], nil);
}

- (void)testCellLaserActivityMirrorRight {
    id cell = [MirrorCell new];
    [cell leanRight];
    [cell setLaserEntersFrom:North];
    STAssertTrue([cell isOn], nil);
    STAssertTrue([cell isSegmentOnFor:North], nil);
    STAssertFalse([cell isSegmentOnFor:East], nil);
    STAssertFalse([cell isSegmentOnFor:South], nil);
    STAssertTrue([cell isSegmentOnFor:West], nil);
}


@end
