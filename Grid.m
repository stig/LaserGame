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

@implementation Grid

- (id)initWithRows:(unsigned)rows columns:(unsigned)columns {
    [super init];
    
    self.cells = [NSMutableDictionary new];
    if (!self.cells)
        return nil;
    
    self.laserIsActive = NO;
    self.numberOfRows = rows;
    self.numberOfColumns = columns;
    
    for (int r = 1; r <= self.numberOfRows; r++) {
        for (int c = 1; c <= self.numberOfColumns; c++) {
            NSString *location = [NSString stringWithFormat:@"%d@%d", r, c];
            [self setCell:[BlankCell new] at:location];
        }
    }
    
    return self;    
}

- (id)init {
    return [self initWithRows:3 columns:3];
}

- (id)at:(NSString*)position {
    return [self.cells objectForKey:position];
}

- (void)setCell:(Cell*)cell at:(NSString*)position {
    cell.gridLocation = position;
    [self.cells setObject:cell forKey:position];
}

- (Cell*)startingCell {
    return [self at:@"1@1"];
}

- (void)calculatePath {
    self.laserBeamPath = [NSMutableArray new];
    id cell = [self startingCell];
    id element = [LaserPathElement laserPathElementWithCell:cell entrySide:@"South"];
    do {
        [self.laserBeamPath addObject:element];
        element = [element nextElementIn:self];
    } while (element);
}

- (void)activateCellsInPath {
    NSLog(@"activateCellsInPath");
    self.laserIsActive = YES;
    [self calculatePath];
    [self.laserBeamPath makeObjectsPerformSelector:@selector(activateCell)];
}

- (id)laserLength {
    return self.laserIsActive ? [NSNumber numberWithInt:[laserBeamPath count]] : @"n/a";
}

@synthesize cells;
@synthesize laserIsActive;
@synthesize numberOfRows;
@synthesize numberOfColumns;
@synthesize laserBeamPath;
@end
