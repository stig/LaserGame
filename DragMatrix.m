//
//  DragMatrix.m
//  LaserGame
//
//  Created by Stig Brautaset on 12/07/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "DragMatrix.h"
#import "AppController.h"

@implementation DragMatrix

#pragma mark Drag-and-drop

- (NSDragOperation)draggingSourceOperationMaskForLocal:(BOOL)isLocal {
    return isLocal ? NSDragOperationMove : NSDragOperationNone;
}

- (void)getRow:(int*)row column:(int*)column forEvent:(NSEvent*)event {
    NSPoint pt = [self convertPoint:[event locationInWindow] fromView:nil];
    [self getRow:row column:column forPoint:pt];
}

- (void)mouseDown:(NSEvent*)event {
    [self getRow:&srcRow column:&srcColumn forEvent:event];
    [self selectCellAtRow:srcRow column:srcColumn];
    NSLog(@"mouseDown: %u, %u", srcRow, srcColumn);
}

- (void)mouseUp:(NSEvent*)event {
    int row, column;
    [self getRow:&row column:&column forEvent:event];
    NSLog(@"mouseUp: %u, %u", srcRow, srcColumn);

    NSLog(@"%@", [self delegate]);
    if (row == srcRow && column == srcColumn) {
        NSLog(@"Sending click action");
        [[self delegate] matrixClickAction:self];
    } else {
        NSLog(@"Will swap cells %u, %u with %u, %u", srcRow, srcColumn, row, column);
        [[self delegate] swapCellAtPoint:NSMakePoint(srcColumn, srcRow)
                         withCellAtPoint:NSMakePoint(column, row)];
    }
}

- (void)XXmouseDragged:(NSEvent*)event {
    NSLog(@"selectedCell: %@", [self selectedCell]);
    NSLog(@"row: %u column: %u", [self selectedRow], [self selectedColumn]);
}


@end
