//
//  AppController.h
//  LaserGame
//
//  Created by Stig Brautaset on 24/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Grid;
@class CellRenderer;

@interface AppController : NSObjectController {
    IBOutlet NSMatrix *board;
    IBOutlet NSButton *fireButton;
    IBOutlet NSTextField *lengthField;

    Grid *grid;
}

- (void)configureMatrix;

- (IBAction)toggleLaser:(id)sender;
- (IBAction)matrixClickAction:(id)sender;

- (void)swapCellAtPoint:(NSPoint)a withCellAtPoint:(NSPoint)b;

@end
