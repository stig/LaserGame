//
//  AppController.m
//  LaserGame
//
//  Created by Stig Brautaset on 24/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "AppController.h"
#import "Grid.h"
#import "GridFactory.h"
#import "CellRenderer.h"

@implementation AppController

- (id)init {
    self = [super init];
    if (!self)
        return nil;
    
    grid = [GridFactory demoGrid];
    
    return self;
}

- (IBAction)fireLaser:(id)sender {
    NSLog(@"fireLaser:");
    [grid activateCellsInPath];
}


#pragma mark Pass-through

- (unsigned)numberOfRows {
    return [grid numberOfRows];
}

- (unsigned)numberOfColumns {
    return [grid numberOfColumns];
}

- (CellRenderer*)rendererForCell:(NSPoint)point {
    id loc = [NSValue valueWithPoint:point];
    id cell = [grid at:loc];
    CellRenderer *renderer = [[CellRenderer rendererFor:cell] new];
    renderer.grid = grid;
    renderer.cellLocation = loc;
    return renderer;
}

@end
