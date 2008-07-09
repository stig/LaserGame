//
//  TargetCellRenderer.m
//  LaserGame
//
//  Created by Stig Brautaset on 23/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "TargetCellRenderer.h"
#import "TargetCell.h"
#import "Grid.h"

@implementation TargetCellRenderer

+ (Class)modelClass {
    return [TargetCell class];
}

- (void)drawInteriorWithFrame:(NSRect)rect inView:(NSView*)v {
    [super drawInteriorWithFrame:rect inView:v];
    id cell = [grid at:cellLocation];
    NSColor *cellColour = [cell isOn] ? [NSColor redColor] : [NSColor cyanColor];

    [NSBezierPath setDefaultLineWidth:3];

    // Draw center of target
    id path = [NSBezierPath bezierPath];
    [path appendBezierPathWithOvalInRect:[self rect:rect scaledDownBy:0.25]];
    [cellColour set];
    [path fill];

    // draw the cross-hairs, simply by putting a cross in the cell
    NSRect r = [self rect:rect scaledDownBy:0.15];
    path = [NSBezierPath bezierPath];
    [path moveToPoint:NSMakePoint(r.origin.x + r.size.width/2.0, r.origin.y)];
    [path lineToPoint:NSMakePoint(r.origin.x + r.size.width/2.0, r.origin.y + r.size.height)];
    
    [path moveToPoint:NSMakePoint(r.origin.x, r.origin.y + r.size.height/2.0)];
    [path lineToPoint:NSMakePoint(r.origin.x + r.size.width, r.origin.y + r.size.height/2.0)];

    // outline the circle
    [path appendBezierPathWithOvalInRect:[self rect:rect scaledDownBy:0.25]];
    [[NSColor blueColor] set];

    [path stroke];
    
    // finish the cross-hairs by clipping the middle of the cross off
    [cellColour set];
    [[NSBezierPath bezierPathWithOvalInRect:[self rect:r scaledDownBy:0.35]] fill];
}

@end
