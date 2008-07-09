//
//  CellRenderer.h
//  LaserGame
//
//  Created by Stig Brautaset on 23/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Grid;

@interface CellRenderer : NSCell {
    NSPoint cellLocation;
    Grid *grid;
}

@property(assign) NSPoint cellLocation;
@property(retain) Grid *grid;

+ (Class)modelClass;
+ (Class)rendererFor:(id)cell;

- (void)clickCell;
- (NSRect)rect:(NSRect)r scaledDownBy:(float)scale;

@end
