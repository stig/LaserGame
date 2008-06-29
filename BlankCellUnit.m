//
//  BlankCellUnit.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "BlankCellUnit.h"
#import "BlankCell.h"

@implementation BlankCellUnit

- (void)testCellOnState {
    id cell = [BlankCell new];
    STAssertFalse([cell isOn], nil);
    STAssertTrue([cell isOff], nil);
}

- (void)testCellSegmentState {
    id cell = [BlankCell new];
    STAssertFalse([cell isSegmentOnFor:@"North"], nil);
    STAssertFalse([cell isSegmentOnFor:@"East"], nil);
    STAssertFalse([cell isSegmentOnFor:@"South"], nil);
    STAssertFalse([cell isSegmentOnFor:@"West"], nil);
}

- (void)testExitSides {
    id cell = [BlankCell new];
    STAssertEqualObjects([cell exitSideFor:@"North"], @"South", nil);
    STAssertEqualObjects([cell exitSideFor:@"East"], @"West", nil);
    STAssertEqualObjects([cell exitSideFor:@"South"], @"North", nil);
    STAssertEqualObjects([cell exitSideFor:@"West"], @"East", nil);
}

- (void)testCellLaserActivity {
    id cell = [BlankCell new];
    [cell setLaserEntersFrom:@"North"];
    STAssertTrue([cell isOn], nil);
    STAssertTrue([cell isSegmentOnFor:@"North"], nil);
    STAssertFalse([cell isSegmentOnFor:@"East"], nil);
    STAssertTrue([cell isSegmentOnFor:@"South"], nil);
    STAssertFalse([cell isSegmentOnFor:@"West"], nil);
}

@end
