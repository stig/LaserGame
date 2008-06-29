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
    if (!self.cells)
        return nil;
    
    self.laserActive = NO;
    self.numberOfRows = rows;
    self.numberOfColumns = columns;
    
    for (int r = 0; r < self.numberOfRows; r++) {
        for (int c = 0; c < self.numberOfColumns; c++) {
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
    self.laserBeamPath = [NSMutableArray new];
    id cell = [self startingCell];
    id element = [LaserPathElement laserPathElementWithCell:cell entrySide:South];
    do {
        [self.laserBeamPath addObject:element];
        element = [element nextElementIn:self];
    } while (element);
}

- (void)activateCellsInPath {
    self.laserActive = YES;
    [self calculatePath];
    [self.laserBeamPath makeObjectsPerformSelector:@selector(activateCell)];
}

- (unsigned)laserLength {
    return [laserBeamPath count];
}

@synthesize cells;
@synthesize laserActive;
@synthesize numberOfRows;
@synthesize numberOfColumns;
@synthesize laserBeamPath;
@end
