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
    IBOutlet NSView *boardView;
    IBOutlet NSButton *fireButton;
    IBOutlet NSTextField *lengthField;

    Grid *grid;
}

- (IBAction)fireLaser:(id)sender;

- (unsigned)numberOfRows;
- (unsigned)numberOfColumns;

- (CellRenderer*)rendererForCell:(NSPoint)point;

@end
