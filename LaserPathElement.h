//
//  LaserPathElement.h
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Cell;
@class Grid;

@interface LaserPathElement : NSObject {
    Cell *cell;
    NSString *entrySide;
}

@property(retain) Cell *cell;
@property(copy) NSString *entrySide;

+ (id)laserPathElementWithCell:(Cell*)cell entrySide:(NSString*)entrySide;
- (id)initWithCell:(Cell*)aCell entrySide:(NSString*)aSide;

- (id)nextElementIn:(Grid*)grid;
- (void)activateCell;

@end
