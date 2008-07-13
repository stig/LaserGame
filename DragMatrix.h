//
//  DragMatrix.h
//  LaserGame
//
//  Created by Stig Brautaset on 12/07/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DragMatrix : NSMatrix {
    int srcRow, srcColumn;
}

- (void)getRow:(int*)row column:(int*)column forEvent:(NSEvent*)event;

@end
