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
    [grid setCell:[MirrorCell leanRight] at:[NSValue valueWithPoint:NSMakePoint(0, 0)]];
    [grid setCell:[MirrorCell leanRight] at:[NSValue valueWithPoint:NSMakePoint(3, 0)]];

    [grid setCell:[MirrorCell leanLeft] at:[NSValue valueWithPoint:NSMakePoint(1, 1)]];
    [grid setCell:[MirrorCell leanLeft] at:[NSValue valueWithPoint:NSMakePoint(2, 1)]];
    
    [grid setCell:[MirrorCell leanLeft] at:[NSValue valueWithPoint:NSMakePoint(1, 2)]];
    [grid setCell:[MirrorCell leanRight] at:[NSValue valueWithPoint:NSMakePoint(2, 2)]];
    [grid setCell:[MirrorCell leanLeft] at:[NSValue valueWithPoint:NSMakePoint(4, 2)]];
    
    [grid setCell:[MirrorCell leanRight] at:[NSValue valueWithPoint:NSMakePoint(0, 3)]];
    [grid setCell:[MirrorCell leanLeft] at:[NSValue valueWithPoint:NSMakePoint(4, 3)]];

    [grid setCell:[MirrorCell leanRight] at:[NSValue valueWithPoint:NSMakePoint(3, 4)]];
    [grid setCell:[TargetCell new] at:[NSValue valueWithPoint:NSMakePoint(4, 4)]];
    return grid;    
}
@end
