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
    [grid setCell:[MirrorCell leanRight] at:@"1@1"];
    [grid setCell:[MirrorCell leanRight] at:@"4@1"];

    [grid setCell:[MirrorCell leanLeft] at:@"2@2"];
    [grid setCell:[MirrorCell leanLeft] at:@"3@2"];
    
    [grid setCell:[MirrorCell leanLeft] at:@"2@3"];
    [grid setCell:[MirrorCell leanRight] at:@"3@3"];
    [grid setCell:[MirrorCell leanLeft] at:@"5@3"];
    
    [grid setCell:[MirrorCell leanRight] at:@"1@4"];
    [grid setCell:[MirrorCell leanLeft] at:@"5@4"];

    [grid setCell:[MirrorCell leanRight] at:@"4@5"];
    [grid setCell:[TargetCell new] at:@"5@5"];
    return grid;    
}
@end
