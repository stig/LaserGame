//
//  Board.h
//  LaserGame
//
//  Created by Stig Brautaset on 24/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class AppController;

@interface Board : NSView {
    IBOutlet AppController *delegate;
    unsigned rows, columns;
}

@property unsigned rows;
@property unsigned columns;

@end
