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

- (void)awakeFromNib {
    [self configureMatrix];
}

- (id)init {
    self = [super init];
    if (!self)
        return nil;
    
    grid = [GridFactory demoGrid];
    return self;
}

- (void)configureMatrix {
    
    int rows, columns;
    [board getNumberOfRows:&rows columns:&columns];

    for (;rows > [grid rows]; rows--)
        [board removeRow:0];
    
    for (;columns > [grid columns]; columns++)
        [board removeColumn:0];
        
    for (;rows < [grid rows]; rows++)
        [board addRow];
    
    for (;columns < [grid columns]; columns++)
        [board addColumn];

    // The matrix is initialised from the nib with NSImageCell objects.
    // We need to replace these with copies of our EmptyCell class.
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < columns; j++) {
            NSPoint cellLocation = NSMakePoint(j, i);
            id cell = [grid at:cellLocation];
            
            CellRenderer *renderer = [[CellRenderer rendererFor:cell] new];
            renderer.grid = grid;
            renderer.cellLocation = cellLocation;
            
            [board putCell:renderer atRow:i column:j];
        }
    }
    
    NSRect frame = board.frame;
    board.frame = NSZeroRect;
    board.frame = frame;
    [board setNeedsDisplay:YES];
}

#pragma mark Actions

- (IBAction)generateRandomGrid:(id)sender {
    grid = [[Grid alloc] initWithRows:10 columns:9];
    [sender setNeedsDisplay:YES];
}

- (IBAction)toggleLaser:(id)sender {
    if ([grid laserActive]) {
        NSLog(@"laser is active. stopping");
        [grid stopLaser];
    } else {
        NSLog(@"laser is inactive. firing");
        [grid fireLaser];
    }
    [board setNeedsDisplay:YES];
}

- (IBAction)matrixClickAction:(id)sender {
    id cell = [sender selectedCell];
    [cell clickCell];
    
    [grid at:[cell cellLocation]];
    NSLog(@"matrixClickAction: %@", [NSValue valueWithPoint:[cell cellLocation]]);
    [board setNeedsDisplay:YES];
}


@end
