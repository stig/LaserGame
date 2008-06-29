//
//  Board.m
//  LaserGame
//
//  Created by Stig Brautaset on 24/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "Board.h"
#import "AppController.h"
#import "CellRenderer.h"

@implementation Board

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (!self)
        return nil;

    // Initialization code here.
    return self;
}

- (NSRect)rectForCell:(NSPoint)p {
    NSRect rect = [self bounds];
    NSRect r;
    r.origin = NSMakePoint(rect.size.width/self.columns * p.x, rect.size.height/self.rows * p.y);
    r.size = NSMakeSize(rect.size.width/self.columns, rect.size.height/self.rows);
    return r;
}

- (void)drawRect:(NSRect)rect {
    NSRect bounds = [self bounds];
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect: bounds];
    
    [[NSColor blueColor] set];
    [NSBezierPath strokeRect: bounds];
    
    if (!delegate)
        return;
    
    self.rows = [delegate numberOfRows];
    self.columns = [delegate numberOfColumns];
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < columns; j++) {
            NSPoint cell = NSMakePoint(i, j);
            CellRenderer *renderer = [delegate rendererForCell:cell];
            renderer.rect = [self rectForCell:cell];
            [renderer render];
        }
}

- (void)mouseDown:(NSEvent*)event {
    NSLog(@"event");
}

@synthesize rows;
@synthesize columns;
@end
