//
//  CellRenderer.h
//  LaserGame
//
//  Created by Stig Brautaset on 23/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Grid;

@interface CellRenderer : NSObject {
    NSString *cellLocation;
    Grid *grid;
    NSRect rect;
}

@property(copy) NSString *cellLocation;
@property(retain) Grid *grid;
@property NSRect rect;

+ (Class)modelClass;
+ (Class)rendererFor:(id)cell;

- (void)render;
- (void)renderBorder;
- (void)renderContents;

- (NSRect)rectScaledDownBy:(float)scale;

@end
