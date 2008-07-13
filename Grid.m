//
//  Grid.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "Grid.h"
#import "Cell.h"
#import "BlankCell.h"
#import "LaserPathElement.h"
#import "GridDirection.h"

@implementation Grid

- (id)initWithRows:(unsigned)r columns:(unsigned)c {
    [super init];
    
    self.cells = [NSMutableDictionary new];
    if (!cells)
        return nil;

    self.laserBeamPath = [NSMutableArray new];
    if (!laserBeamPath)
        return nil;
    
    self.laserActive = NO;
    self.rows = r;
    self.columns = c;

    for (int r = 0; r < rows; r++) {
        for (int c = 0; c < columns; c++) {
            [self setCell:[BlankCell new] at:NSMakePoint(r, c)];
        }
    }
    
    return self;    
}

- (id)init {
    return [self initWithRows:3 columns:3];
}

- (id)at:(NSPoint)position {
    return [cells objectForKey:[NSValue valueWithPoint:position]];
}

- (void)setCell:(Cell*)cell at:(NSPoint)position {
    cell.gridLocation = position;
    [cells setObject:cell forKey: [NSValue valueWithPoint: position]];
}

- (void)swapCell:(Cell*)a withCell:(Cell*)b {
    NSPoint aLoc = [a gridLocation];
    NSPoint bLoc = [b gridLocation];
    
    [self setCell:a at:bLoc];
    [self setCell:b at:aLoc];
}

- (Cell*)startingCell {
    return [self at:NSMakePoint(0, self.rows-1)];
}

- (void)calculatePath {
    [self willChangeValueForKey:@"laserLength"];
    [laserBeamPath removeAllObjects];
    id cell = [self startingCell];
    id element = [LaserPathElement laserPathElementWithCell:cell entrySide:South];
    do {
        [laserBeamPath addObject:element];
        element = [element nextElementIn:self];
    } while (element);
    [self didChangeValueForKey:@"laserLength"];
}

- (void)activateCellsInPath {
    [self calculatePath];
    [laserBeamPath makeObjectsPerformSelector:@selector(activateCell)];
}

- (void)clearCellsInPath {
    [laserBeamPath makeObjectsPerformSelector:@selector(clearCell)];
    [laserBeamPath removeAllObjects];
}

- (unsigned)laserLength {
    return [laserBeamPath count];
}

- (void)fireLaser {
    self.laserActive = YES;
    [self activateCellsInPath];
}

- (void)stopLaser {
    self.laserActive = NO;
    [self clearCellsInPath];
}

@synthesize cells;
@synthesize laserActive;
@synthesize rows;
@synthesize columns;
@synthesize laserBeamPath;
@end
