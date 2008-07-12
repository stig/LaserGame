//
//  CellRenderer.m
//  LaserGame
//
//  Created by Stig Brautaset on 23/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "CellRenderer.h"
#import "BlankCellRenderer.h"
#import "MirrorCellRenderer.h"
#import "TargetCellRenderer.h"
#import "Cell.h"
#import "Grid.h"
#import "GridDirection.h"

@implementation CellRenderer

+ (Class)modelClass {
    return nil;
}

+ (Class)rendererFor:(id)cell {
    if ([cell isKindOfClass:[BlankCellRenderer modelClass]])
        return [BlankCellRenderer class];
    else if ([cell isKindOfClass:[MirrorCellRenderer modelClass]])
        return [MirrorCellRenderer class];
    else if ([cell isKindOfClass:[TargetCellRenderer modelClass]])
        return [TargetCellRenderer class];
    @throw(@"unrecognised cell");
}

- (void)renderLaserFromPoint:(NSPoint)a toPoint:(NSPoint)b {
    [[NSColor yellowColor] set];
    [NSBezierPath setDefaultLineWidth:6];
    [NSBezierPath strokeLineFromPoint:a toPoint:b];

    [[NSColor orangeColor] set];
    [NSBezierPath setDefaultLineWidth:1];
    [NSBezierPath strokeLineFromPoint:a toPoint:b];
}

- (void)renderLaserWithFrame:(NSRect)r inView:(NSView*)v {
    NSPoint center = NSMakePoint(NSMidX(r), NSMidY(r));
    Cell *cell = [grid at:cellLocation];

    if ([cell isSegmentOnFor:North])
        [self renderLaserFromPoint:center
                           toPoint:NSMakePoint(NSMidX(r), NSMinY(r))];
        
    if ([cell isSegmentOnFor:East])
        [self renderLaserFromPoint:center
                           toPoint:NSMakePoint(NSMaxX(r), NSMidY(r))];
    
    if ([cell isSegmentOnFor:South])
        [self renderLaserFromPoint:center
                           toPoint:NSMakePoint(NSMidX(r), NSMaxY(r))];

    if ([cell isSegmentOnFor:West])
        [self renderLaserFromPoint:center
                           toPoint:NSMakePoint(NSMinX(r), NSMidY(r))];
    
}

- (void)drawInteriorWithFrame:(NSRect)r inView:(NSView*)v {
    [[NSColor blueColor] set];
    [NSBezierPath setDefaultLineWidth:2];
    [NSBezierPath strokeRect:r];
    [self renderLaserWithFrame:r inView:v];
}

- (NSRect)rect:(NSRect)r scaledDownBy:(float)scale {
    float dw = r.size.width * scale;
    float dh = r.size.height * scale;
    r.origin.x += dw;
    r.origin.y += dh;
    r.size.height -= dh * 2;
    r.size.width -= dw * 2;
    return r;
}

- (void)clickCell {
    NSLog(@"-[%@ clickCell]", [self className]);
}


@synthesize cellLocation;
@synthesize grid;
@end
