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

- (id)initWithRows:(unsigned)rows columns:(unsigned)columns {
    [super init];
    
    self.cells = [NSMutableDictionary new];
    if (!cells)
        return nil;

    self.laserBeamPath = [NSMutableArray new];
    if (!laserBeamPath)
        return nil;
    
    self.laserActive = NO;
    self.numberOfRows = rows;
    self.numberOfColumns = columns;

    for (int r = 0; r < numberOfRows; r++) {
        for (int c = 0; c < numberOfColumns; c++) {
            NSValue *location = [NSValue valueWithPoint:NSMakePoint(r, c)];
            [self setCell:[BlankCell new] at:location];
        }
    }
    
    return self;    
}

- (id)init {
    return [self initWithRows:3 columns:3];
}

- (id)at:(NSValue*)position {
    return [cells objectForKey:position];
}

- (void)setCell:(Cell*)cell at:(NSValue*)position {
    cell.gridLocation = position;
    [cells setObject:cell forKey:position];
}

- (Cell*)startingCell {
    return [self at:[NSValue valueWithPoint:NSMakePoint(0, 0)]];
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
@synthesize numberOfRows;
@synthesize numberOfColumns;
@synthesize laserBeamPath;
@end
