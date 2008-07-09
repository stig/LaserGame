//
//  GridFactory.m
//  LaserGame
//
//  Created by Stig Brautaset on 29/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "GridFactory.h"
#import "Grid.h"
#import "MirrorCell.h"
#import "TargetCell.h"

@implementation GridFactory

+ (Grid*)demoGrid {
    Grid *grid = [[Grid alloc] initWithRows:5 columns:5];
    [grid setCell:[MirrorCell leanRight] at:NSMakePoint(0, 4)];
    [grid setCell:[MirrorCell leanRight] at:NSMakePoint(3, 4)];

    [grid setCell:[MirrorCell leanLeft] at:NSMakePoint(1, 3)];
    [grid setCell:[MirrorCell leanLeft] at:NSMakePoint(2, 3)];
    
    [grid setCell:[MirrorCell leanLeft] at:NSMakePoint(1, 2)];
    [grid setCell:[MirrorCell leanRight] at:NSMakePoint(2, 2)];
    [grid setCell:[MirrorCell leanLeft] at:NSMakePoint(4, 2)];
    
    [grid setCell:[MirrorCell leanRight] at:NSMakePoint(0, 1)];
    [grid setCell:[MirrorCell leanLeft] at:NSMakePoint(4, 1)];

    [grid setCell:[MirrorCell leanRight] at:NSMakePoint(3, 0)];
    [grid setCell:[TargetCell new] at:NSMakePoint(4, 0)];
    return grid;    
}
@end
