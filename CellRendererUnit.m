//
//  CellRendererUnit.m
//  LaserGame
//
//  Created by Stig Brautaset on 29/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "CellRendererUnit.h"
#import "CellRenderer.h"
#import "BlankCellRenderer.h"
#import "MirrorCellRenderer.h"
#import "TargetCellRenderer.h"
#import "BlankCell.h"
#import "MirrorCell.h"
#import "TargetCell.h"

@implementation CellRendererUnit

- (void)testCellRendererSelection {
    id cell = [BlankCell new];
    id renderer = [CellRenderer rendererFor:cell];
    STAssertTrue(renderer == [BlankCellRenderer class], nil);

    cell = [MirrorCell new];
    renderer = [CellRenderer rendererFor:cell];
    STAssertTrue(renderer == [MirrorCellRenderer class], nil);

    cell = [TargetCell new];
    renderer = [CellRenderer rendererFor:cell];
    STAssertTrue(renderer == [TargetCellRenderer class], nil);
}

@end
