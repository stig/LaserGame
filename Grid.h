//
//  Grid.h
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Cell;

@interface Grid : NSObject {
    NSMutableDictionary *cells;
    BOOL laserActive;
    unsigned rows;
    unsigned columns;
    NSMutableArray *laserBeamPath;
}

@property(retain) NSMutableDictionary *cells;
@property BOOL laserActive;
@property unsigned rows;
@property unsigned columns;
@property(retain) NSMutableArray *laserBeamPath;

- (id)initWithRows:(unsigned)rows columns:(unsigned)columns;

- (id)at:(NSPoint)position;
- (void)setCell:(Cell*)cell at:(NSPoint)position;

- (void)fireLaser;
- (void)stopLaser;
- (unsigned)laserLength;

- (Cell*)startingCell;
- (void)calculatePath;
- (void)activateCellsInPath;
- (void)clearCellsInPath;

- (void)swapCell:(Cell*)a withCell:(Cell*)b;

@end
