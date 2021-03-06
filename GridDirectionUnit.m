//
//  GridDirectionUnit.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "GridDirectionUnit.h"
#import "GridDirection.h"

@implementation GridDirectionUnit

- (void)testDirectionSelection {
    id direction;
    direction = [GridDirection directionFor:North];
    STAssertEqualObjects([direction directionSymbol], North, nil);
    STAssertEquals([direction vector], NSMakePoint(0, -1), nil);
    STAssertEqualObjects([direction adjecentInversionSymbol], South, nil);

    direction = [GridDirection directionFor:East];
    STAssertEqualObjects([direction directionSymbol], East, nil);
    STAssertEquals([direction vector], NSMakePoint(1, 0), nil);
    STAssertEqualObjects([direction adjecentInversionSymbol], West, nil);
    
    direction = [GridDirection directionFor:South];
    STAssertEqualObjects([direction directionSymbol], South, nil);
    STAssertEquals([direction vector], NSMakePoint(0, 1), nil);
    STAssertEqualObjects([direction adjecentInversionSymbol], North, nil);
    
    direction = [GridDirection directionFor:West];
    STAssertEqualObjects([direction directionSymbol], West, nil);
    STAssertEquals([direction vector], NSMakePoint(-1, 0), nil);
    STAssertEqualObjects([direction adjecentInversionSymbol], East, nil);
}

@end
