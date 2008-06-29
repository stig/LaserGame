//
//  Grid.h
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Cell;
@class LaserBeamPath;

@interface Grid : NSObject {
    NSMutableDictionary *cells;
    BOOL laserIsActive;
    unsigned numberOfRows;
    unsigned numberOfColumns;
    LaserBeamPath *laserBeamPath;
}

@property(retain) NSMutableDictionary *cells;
@property BOOL laserIsActive;
@property unsigned numberOfRows;
@property unsigned numberOfColumns;
@property(retain) LaserBeamPath *laserBeamPath;

- (id)initWithRows:(unsigned)rows columns:(unsigned)columns;

- (id)at:(NSString*)position;
- (void)setCell:(Cell*)cell at:(NSString*)position;
- (Cell*)startingCell;
- (void)calculatePath;
- (void)activateCellsInPath;

- (id)laserLength;

@end
